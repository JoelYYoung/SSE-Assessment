; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %call = call i32 @staticReturnsTrue(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %6, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx2, align 1, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %7 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call5 = call i64 @strlen(i8* %arraydecay4) #7, !dbg !52
  %mul = mul i64 %call5, 1, !dbg !53
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !49
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx6, align 1, !dbg !55
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay7), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_08_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #8, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #8, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__char_alloca_memmove_08_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__char_alloca_memmove_08_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !82 {
entry:
  ret i32 1, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 50, align 16, !dbg !91
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %1 = alloca i8, i64 100, align 16, !dbg !94
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !93
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !96
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !100
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !101
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !101
  store i8 0, i8* %arrayidx1, align 1, !dbg !102
  %call = call i32 @staticReturnsFalse(), !dbg !103
  %tobool = icmp ne i32 %call, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end, !dbg !108

if.else:                                          ; preds = %entry
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !109
  store i8* %6, i8** %data, align 8, !dbg !111
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !112, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx2, align 1, !dbg !117
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  %7 = load i8*, i8** %data, align 8, !dbg !119
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  %call5 = call i64 @strlen(i8* %arraydecay4) #7, !dbg !121
  %mul = mul i64 %call5, 1, !dbg !122
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !118
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx6, align 1, !dbg !124
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @printLine(i8* %arraydecay7), !dbg !126
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !128 {
entry:
  ret i32 0, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !130 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = alloca i8, i64 50, align 16, !dbg !135
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  %1 = alloca i8, i64 100, align 16, !dbg !138
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !137
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !140
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !141
  store i8 0, i8* %arrayidx, align 1, !dbg !142
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !144
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !145
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !145
  store i8 0, i8* %arrayidx1, align 1, !dbg !146
  %call = call i32 @staticReturnsTrue(), !dbg !147
  %tobool = icmp ne i32 %call, 0, !dbg !147
  br i1 %tobool, label %if.then, label %if.end, !dbg !149

if.then:                                          ; preds = %entry
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !150
  store i8* %6, i8** %data, align 8, !dbg !152
  br label %if.end, !dbg !153

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !154, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !157
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !158
  store i8 0, i8* %arrayidx2, align 1, !dbg !159
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !160
  %7 = load i8*, i8** %data, align 8, !dbg !161
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !162
  %call5 = call i64 @strlen(i8* %arraydecay4) #7, !dbg !163
  %mul = mul i64 %call5, 1, !dbg !164
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %7, i64 %mul, i1 false), !dbg !160
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx6, align 1, !dbg !166
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* %arraydecay7), !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 41, type: !4)
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocation(line: 41, column: 37, scope: !13)
!25 = !DILocation(line: 42, column: 12, scope: !13)
!26 = !DILocation(line: 42, column: 5, scope: !13)
!27 = !DILocation(line: 43, column: 5, scope: !13)
!28 = !DILocation(line: 43, column: 25, scope: !13)
!29 = !DILocation(line: 44, column: 12, scope: !13)
!30 = !DILocation(line: 44, column: 5, scope: !13)
!31 = !DILocation(line: 45, column: 5, scope: !13)
!32 = !DILocation(line: 45, column: 27, scope: !13)
!33 = !DILocation(line: 46, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 46, column: 8)
!35 = !DILocation(line: 46, column: 8, scope: !13)
!36 = !DILocation(line: 49, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !14, line: 47, column: 5)
!38 = !DILocation(line: 49, column: 14, scope: !37)
!39 = !DILocation(line: 50, column: 5, scope: !37)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !14, line: 52, type: !42)
!41 = distinct !DILexicalBlock(scope: !13, file: !14, line: 51, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 52, column: 14, scope: !41)
!46 = !DILocation(line: 53, column: 9, scope: !41)
!47 = !DILocation(line: 54, column: 9, scope: !41)
!48 = !DILocation(line: 54, column: 21, scope: !41)
!49 = !DILocation(line: 57, column: 9, scope: !41)
!50 = !DILocation(line: 57, column: 23, scope: !41)
!51 = !DILocation(line: 57, column: 36, scope: !41)
!52 = !DILocation(line: 57, column: 29, scope: !41)
!53 = !DILocation(line: 57, column: 41, scope: !41)
!54 = !DILocation(line: 58, column: 9, scope: !41)
!55 = !DILocation(line: 58, column: 21, scope: !41)
!56 = !DILocation(line: 59, column: 19, scope: !41)
!57 = !DILocation(line: 59, column: 9, scope: !41)
!58 = !DILocation(line: 61, column: 1, scope: !13)
!59 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_08_good", scope: !14, file: !14, line: 126, type: !15, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 128, column: 5, scope: !59)
!61 = !DILocation(line: 129, column: 5, scope: !59)
!62 = !DILocation(line: 130, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 142, type: !64, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !14, line: 142, type: !66)
!69 = !DILocation(line: 142, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !14, line: 142, type: !67)
!71 = !DILocation(line: 142, column: 27, scope: !63)
!72 = !DILocation(line: 145, column: 22, scope: !63)
!73 = !DILocation(line: 145, column: 12, scope: !63)
!74 = !DILocation(line: 145, column: 5, scope: !63)
!75 = !DILocation(line: 147, column: 5, scope: !63)
!76 = !DILocation(line: 148, column: 5, scope: !63)
!77 = !DILocation(line: 149, column: 5, scope: !63)
!78 = !DILocation(line: 152, column: 5, scope: !63)
!79 = !DILocation(line: 153, column: 5, scope: !63)
!80 = !DILocation(line: 154, column: 5, scope: !63)
!81 = !DILocation(line: 156, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !83, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!66}
!85 = !DILocation(line: 27, column: 5, scope: !82)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 70, type: !4)
!88 = !DILocation(line: 70, column: 12, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !14, line: 71, type: !4)
!90 = !DILocation(line: 71, column: 12, scope: !86)
!91 = !DILocation(line: 71, column: 36, scope: !86)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !14, line: 72, type: !4)
!93 = !DILocation(line: 72, column: 12, scope: !86)
!94 = !DILocation(line: 72, column: 37, scope: !86)
!95 = !DILocation(line: 73, column: 12, scope: !86)
!96 = !DILocation(line: 73, column: 5, scope: !86)
!97 = !DILocation(line: 74, column: 5, scope: !86)
!98 = !DILocation(line: 74, column: 25, scope: !86)
!99 = !DILocation(line: 75, column: 12, scope: !86)
!100 = !DILocation(line: 75, column: 5, scope: !86)
!101 = !DILocation(line: 76, column: 5, scope: !86)
!102 = !DILocation(line: 76, column: 27, scope: !86)
!103 = !DILocation(line: 77, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !86, file: !14, line: 77, column: 8)
!105 = !DILocation(line: 77, column: 8, scope: !86)
!106 = !DILocation(line: 80, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !14, line: 78, column: 5)
!108 = !DILocation(line: 81, column: 5, scope: !107)
!109 = !DILocation(line: 85, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !14, line: 83, column: 5)
!111 = !DILocation(line: 85, column: 14, scope: !110)
!112 = !DILocalVariable(name: "dest", scope: !113, file: !14, line: 88, type: !42)
!113 = distinct !DILexicalBlock(scope: !86, file: !14, line: 87, column: 5)
!114 = !DILocation(line: 88, column: 14, scope: !113)
!115 = !DILocation(line: 89, column: 9, scope: !113)
!116 = !DILocation(line: 90, column: 9, scope: !113)
!117 = !DILocation(line: 90, column: 21, scope: !113)
!118 = !DILocation(line: 93, column: 9, scope: !113)
!119 = !DILocation(line: 93, column: 23, scope: !113)
!120 = !DILocation(line: 93, column: 36, scope: !113)
!121 = !DILocation(line: 93, column: 29, scope: !113)
!122 = !DILocation(line: 93, column: 41, scope: !113)
!123 = !DILocation(line: 94, column: 9, scope: !113)
!124 = !DILocation(line: 94, column: 21, scope: !113)
!125 = !DILocation(line: 95, column: 19, scope: !113)
!126 = !DILocation(line: 95, column: 9, scope: !113)
!127 = !DILocation(line: 97, column: 1, scope: !86)
!128 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !83, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocation(line: 32, column: 5, scope: !128)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 100, type: !15, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "data", scope: !130, file: !14, line: 102, type: !4)
!132 = !DILocation(line: 102, column: 12, scope: !130)
!133 = !DILocalVariable(name: "dataBadBuffer", scope: !130, file: !14, line: 103, type: !4)
!134 = !DILocation(line: 103, column: 12, scope: !130)
!135 = !DILocation(line: 103, column: 36, scope: !130)
!136 = !DILocalVariable(name: "dataGoodBuffer", scope: !130, file: !14, line: 104, type: !4)
!137 = !DILocation(line: 104, column: 12, scope: !130)
!138 = !DILocation(line: 104, column: 37, scope: !130)
!139 = !DILocation(line: 105, column: 12, scope: !130)
!140 = !DILocation(line: 105, column: 5, scope: !130)
!141 = !DILocation(line: 106, column: 5, scope: !130)
!142 = !DILocation(line: 106, column: 25, scope: !130)
!143 = !DILocation(line: 107, column: 12, scope: !130)
!144 = !DILocation(line: 107, column: 5, scope: !130)
!145 = !DILocation(line: 108, column: 5, scope: !130)
!146 = !DILocation(line: 108, column: 27, scope: !130)
!147 = !DILocation(line: 109, column: 8, scope: !148)
!148 = distinct !DILexicalBlock(scope: !130, file: !14, line: 109, column: 8)
!149 = !DILocation(line: 109, column: 8, scope: !130)
!150 = !DILocation(line: 112, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !14, line: 110, column: 5)
!152 = !DILocation(line: 112, column: 14, scope: !151)
!153 = !DILocation(line: 113, column: 5, scope: !151)
!154 = !DILocalVariable(name: "dest", scope: !155, file: !14, line: 115, type: !42)
!155 = distinct !DILexicalBlock(scope: !130, file: !14, line: 114, column: 5)
!156 = !DILocation(line: 115, column: 14, scope: !155)
!157 = !DILocation(line: 116, column: 9, scope: !155)
!158 = !DILocation(line: 117, column: 9, scope: !155)
!159 = !DILocation(line: 117, column: 21, scope: !155)
!160 = !DILocation(line: 120, column: 9, scope: !155)
!161 = !DILocation(line: 120, column: 23, scope: !155)
!162 = !DILocation(line: 120, column: 36, scope: !155)
!163 = !DILocation(line: 120, column: 29, scope: !155)
!164 = !DILocation(line: 120, column: 41, scope: !155)
!165 = !DILocation(line: 121, column: 9, scope: !155)
!166 = !DILocation(line: 121, column: 21, scope: !155)
!167 = !DILocation(line: 122, column: 19, scope: !155)
!168 = !DILocation(line: 122, column: 9, scope: !155)
!169 = !DILocation(line: 124, column: 1, scope: !130)
