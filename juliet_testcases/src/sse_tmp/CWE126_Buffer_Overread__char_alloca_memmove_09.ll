; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_09.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_09_bad() #0 !dbg !13 {
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
  %6 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !33
  %tobool = icmp ne i32 %6, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %7, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx2, align 1, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %8 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !52
  %mul = mul i64 %call, 1, !dbg !53
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !49
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx5, align 1, !dbg !55
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay6), !dbg !57
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
define dso_local void @CWE126_Buffer_Overread__char_alloca_memmove_09_good() #0 !dbg !59 {
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
  call void @CWE126_Buffer_Overread__char_alloca_memmove_09_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__char_alloca_memmove_09_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 50, align 16, !dbg !87
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %1 = alloca i8, i64 100, align 16, !dbg !90
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !89
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !92
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !96
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !97
  store i8 0, i8* %arrayidx1, align 1, !dbg !98
  %6 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !99
  %tobool = icmp ne i32 %6, 0, !dbg !99
  br i1 %tobool, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  br label %if.end, !dbg !104

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !105
  store i8* %7, i8** %data, align 8, !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !111
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx2, align 1, !dbg !113
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  %8 = load i8*, i8** %data, align 8, !dbg !115
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !117
  %mul = mul i64 %call, 1, !dbg !118
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !114
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !119
  store i8 0, i8* %arrayidx5, align 1, !dbg !120
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  call void @printLine(i8* %arraydecay6), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !124 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  %0 = alloca i8, i64 50, align 16, !dbg !129
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %1 = alloca i8, i64 100, align 16, !dbg !132
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !131
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !134
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !135
  store i8 0, i8* %arrayidx, align 1, !dbg !136
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !138
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !139
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !139
  store i8 0, i8* %arrayidx1, align 1, !dbg !140
  %6 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !141
  %tobool = icmp ne i32 %6, 0, !dbg !141
  br i1 %tobool, label %if.then, label %if.end, !dbg !143

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !144
  store i8* %7, i8** %data, align 8, !dbg !146
  br label %if.end, !dbg !147

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !148, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !151
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !152
  store i8 0, i8* %arrayidx2, align 1, !dbg !153
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !154
  %8 = load i8*, i8** %data, align 8, !dbg !155
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !156
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !157
  %mul = mul i64 %call, 1, !dbg !158
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !154
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !159
  store i8 0, i8* %arrayidx5, align 1, !dbg !160
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !161
  call void @printLine(i8* %arraydecay6), !dbg !162
  ret void, !dbg !163
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_09_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memmove_09.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 12, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 27, scope: !13)
!33 = !DILocation(line: 32, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!35 = !DILocation(line: 32, column: 8, scope: !13)
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !14, line: 33, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 5, scope: !37)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !14, line: 38, type: !42)
!41 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 38, column: 14, scope: !41)
!46 = !DILocation(line: 39, column: 9, scope: !41)
!47 = !DILocation(line: 40, column: 9, scope: !41)
!48 = !DILocation(line: 40, column: 21, scope: !41)
!49 = !DILocation(line: 43, column: 9, scope: !41)
!50 = !DILocation(line: 43, column: 23, scope: !41)
!51 = !DILocation(line: 43, column: 36, scope: !41)
!52 = !DILocation(line: 43, column: 29, scope: !41)
!53 = !DILocation(line: 43, column: 41, scope: !41)
!54 = !DILocation(line: 44, column: 9, scope: !41)
!55 = !DILocation(line: 44, column: 21, scope: !41)
!56 = !DILocation(line: 45, column: 19, scope: !41)
!57 = !DILocation(line: 45, column: 9, scope: !41)
!58 = !DILocation(line: 47, column: 1, scope: !13)
!59 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memmove_09_good", scope: !14, file: !14, line: 112, type: !15, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 114, column: 5, scope: !59)
!61 = !DILocation(line: 115, column: 5, scope: !59)
!62 = !DILocation(line: 116, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 128, type: !64, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !14, line: 128, type: !66)
!69 = !DILocation(line: 128, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !14, line: 128, type: !67)
!71 = !DILocation(line: 128, column: 27, scope: !63)
!72 = !DILocation(line: 131, column: 22, scope: !63)
!73 = !DILocation(line: 131, column: 12, scope: !63)
!74 = !DILocation(line: 131, column: 5, scope: !63)
!75 = !DILocation(line: 133, column: 5, scope: !63)
!76 = !DILocation(line: 134, column: 5, scope: !63)
!77 = !DILocation(line: 135, column: 5, scope: !63)
!78 = !DILocation(line: 138, column: 5, scope: !63)
!79 = !DILocation(line: 139, column: 5, scope: !63)
!80 = !DILocation(line: 140, column: 5, scope: !63)
!81 = !DILocation(line: 142, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 56, type: !4)
!84 = !DILocation(line: 56, column: 12, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !14, line: 57, type: !4)
!86 = !DILocation(line: 57, column: 12, scope: !82)
!87 = !DILocation(line: 57, column: 36, scope: !82)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !14, line: 58, type: !4)
!89 = !DILocation(line: 58, column: 12, scope: !82)
!90 = !DILocation(line: 58, column: 37, scope: !82)
!91 = !DILocation(line: 59, column: 12, scope: !82)
!92 = !DILocation(line: 59, column: 5, scope: !82)
!93 = !DILocation(line: 60, column: 5, scope: !82)
!94 = !DILocation(line: 60, column: 25, scope: !82)
!95 = !DILocation(line: 61, column: 12, scope: !82)
!96 = !DILocation(line: 61, column: 5, scope: !82)
!97 = !DILocation(line: 62, column: 5, scope: !82)
!98 = !DILocation(line: 62, column: 27, scope: !82)
!99 = !DILocation(line: 63, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !82, file: !14, line: 63, column: 8)
!101 = !DILocation(line: 63, column: 8, scope: !82)
!102 = !DILocation(line: 66, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !14, line: 64, column: 5)
!104 = !DILocation(line: 67, column: 5, scope: !103)
!105 = !DILocation(line: 71, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !100, file: !14, line: 69, column: 5)
!107 = !DILocation(line: 71, column: 14, scope: !106)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !14, line: 74, type: !42)
!109 = distinct !DILexicalBlock(scope: !82, file: !14, line: 73, column: 5)
!110 = !DILocation(line: 74, column: 14, scope: !109)
!111 = !DILocation(line: 75, column: 9, scope: !109)
!112 = !DILocation(line: 76, column: 9, scope: !109)
!113 = !DILocation(line: 76, column: 21, scope: !109)
!114 = !DILocation(line: 79, column: 9, scope: !109)
!115 = !DILocation(line: 79, column: 23, scope: !109)
!116 = !DILocation(line: 79, column: 36, scope: !109)
!117 = !DILocation(line: 79, column: 29, scope: !109)
!118 = !DILocation(line: 79, column: 41, scope: !109)
!119 = !DILocation(line: 80, column: 9, scope: !109)
!120 = !DILocation(line: 80, column: 21, scope: !109)
!121 = !DILocation(line: 81, column: 19, scope: !109)
!122 = !DILocation(line: 81, column: 9, scope: !109)
!123 = !DILocation(line: 83, column: 1, scope: !82)
!124 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !14, line: 88, type: !4)
!126 = !DILocation(line: 88, column: 12, scope: !124)
!127 = !DILocalVariable(name: "dataBadBuffer", scope: !124, file: !14, line: 89, type: !4)
!128 = !DILocation(line: 89, column: 12, scope: !124)
!129 = !DILocation(line: 89, column: 36, scope: !124)
!130 = !DILocalVariable(name: "dataGoodBuffer", scope: !124, file: !14, line: 90, type: !4)
!131 = !DILocation(line: 90, column: 12, scope: !124)
!132 = !DILocation(line: 90, column: 37, scope: !124)
!133 = !DILocation(line: 91, column: 12, scope: !124)
!134 = !DILocation(line: 91, column: 5, scope: !124)
!135 = !DILocation(line: 92, column: 5, scope: !124)
!136 = !DILocation(line: 92, column: 25, scope: !124)
!137 = !DILocation(line: 93, column: 12, scope: !124)
!138 = !DILocation(line: 93, column: 5, scope: !124)
!139 = !DILocation(line: 94, column: 5, scope: !124)
!140 = !DILocation(line: 94, column: 27, scope: !124)
!141 = !DILocation(line: 95, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !124, file: !14, line: 95, column: 8)
!143 = !DILocation(line: 95, column: 8, scope: !124)
!144 = !DILocation(line: 98, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !14, line: 96, column: 5)
!146 = !DILocation(line: 98, column: 14, scope: !145)
!147 = !DILocation(line: 99, column: 5, scope: !145)
!148 = !DILocalVariable(name: "dest", scope: !149, file: !14, line: 101, type: !42)
!149 = distinct !DILexicalBlock(scope: !124, file: !14, line: 100, column: 5)
!150 = !DILocation(line: 101, column: 14, scope: !149)
!151 = !DILocation(line: 102, column: 9, scope: !149)
!152 = !DILocation(line: 103, column: 9, scope: !149)
!153 = !DILocation(line: 103, column: 21, scope: !149)
!154 = !DILocation(line: 106, column: 9, scope: !149)
!155 = !DILocation(line: 106, column: 23, scope: !149)
!156 = !DILocation(line: 106, column: 36, scope: !149)
!157 = !DILocation(line: 106, column: 29, scope: !149)
!158 = !DILocation(line: 106, column: 41, scope: !149)
!159 = !DILocation(line: 107, column: 9, scope: !149)
!160 = !DILocation(line: 107, column: 21, scope: !149)
!161 = !DILocation(line: 108, column: 19, scope: !149)
!162 = !DILocation(line: 108, column: 9, scope: !149)
!163 = !DILocation(line: 110, column: 1, scope: !124)
