; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_14_bad() #0 !dbg !13 {
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
  %6 = load i32, i32* @globalFive, align 4, !dbg !33
  %cmp = icmp eq i32 %6, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataBadBuffer, align 8, !dbg !37
  store i8* %7, i8** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx2, align 1, !dbg !49
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %8 = load i8*, i8** %data, align 8, !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !53
  %mul = mul i64 %call, 1, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !50
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx5, align 1, !dbg !56
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @printLine(i8* %arraydecay6), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_14_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #8, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #8, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_14_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_14_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 50, align 16, !dbg !88
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %1 = alloca i8, i64 100, align 16, !dbg !91
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !90
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !93
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !97
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !98
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !98
  store i8 0, i8* %arrayidx1, align 1, !dbg !99
  %6 = load i32, i32* @globalFive, align 4, !dbg !100
  %cmp = icmp ne i32 %6, 5, !dbg !102
  br i1 %cmp, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !104
  br label %if.end, !dbg !106

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !107
  store i8* %7, i8** %data, align 8, !dbg !109
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !113
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx2, align 1, !dbg !115
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !116
  %8 = load i8*, i8** %data, align 8, !dbg !117
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !119
  %mul = mul i64 %call, 1, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !116
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx5, align 1, !dbg !122
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !123
  call void @printLine(i8* %arraydecay6), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !126 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %0 = alloca i8, i64 50, align 16, !dbg !131
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %1 = alloca i8, i64 100, align 16, !dbg !134
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !133
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !136
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !137
  store i8 0, i8* %arrayidx, align 1, !dbg !138
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !140
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !141
  store i8 0, i8* %arrayidx1, align 1, !dbg !142
  %6 = load i32, i32* @globalFive, align 4, !dbg !143
  %cmp = icmp eq i32 %6, 5, !dbg !145
  br i1 %cmp, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !147
  store i8* %7, i8** %data, align 8, !dbg !149
  br label %if.end, !dbg !150

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !151, metadata !DIExpression()), !dbg !153
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !154
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !155
  store i8 0, i8* %arrayidx2, align 1, !dbg !156
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  %8 = load i8*, i8** %data, align 8, !dbg !158
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !159
  %call = call i64 @strlen(i8* %arraydecay4) #7, !dbg !160
  %mul = mul i64 %call, 1, !dbg !161
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay3, i8* align 1 %8, i64 %mul, i1 false), !dbg !157
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !162
  store i8 0, i8* %arrayidx5, align 1, !dbg !163
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !164
  call void @printLine(i8* %arraydecay6), !dbg !165
  ret void, !dbg !166
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_14_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!35 = !DILocation(line: 32, column: 18, scope: !34)
!36 = !DILocation(line: 32, column: 8, scope: !13)
!37 = !DILocation(line: 35, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !14, line: 33, column: 5)
!39 = !DILocation(line: 35, column: 14, scope: !38)
!40 = !DILocation(line: 36, column: 5, scope: !38)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !14, line: 38, type: !43)
!42 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 38, column: 14, scope: !42)
!47 = !DILocation(line: 39, column: 9, scope: !42)
!48 = !DILocation(line: 40, column: 9, scope: !42)
!49 = !DILocation(line: 40, column: 21, scope: !42)
!50 = !DILocation(line: 43, column: 9, scope: !42)
!51 = !DILocation(line: 43, column: 22, scope: !42)
!52 = !DILocation(line: 43, column: 35, scope: !42)
!53 = !DILocation(line: 43, column: 28, scope: !42)
!54 = !DILocation(line: 43, column: 40, scope: !42)
!55 = !DILocation(line: 44, column: 9, scope: !42)
!56 = !DILocation(line: 44, column: 21, scope: !42)
!57 = !DILocation(line: 45, column: 19, scope: !42)
!58 = !DILocation(line: 45, column: 9, scope: !42)
!59 = !DILocation(line: 47, column: 1, scope: !13)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_14_good", scope: !14, file: !14, line: 112, type: !15, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 114, column: 5, scope: !60)
!62 = !DILocation(line: 115, column: 5, scope: !60)
!63 = !DILocation(line: 116, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 128, type: !65, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !14, line: 128, type: !67)
!70 = !DILocation(line: 128, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !14, line: 128, type: !68)
!72 = !DILocation(line: 128, column: 27, scope: !64)
!73 = !DILocation(line: 131, column: 22, scope: !64)
!74 = !DILocation(line: 131, column: 12, scope: !64)
!75 = !DILocation(line: 131, column: 5, scope: !64)
!76 = !DILocation(line: 133, column: 5, scope: !64)
!77 = !DILocation(line: 134, column: 5, scope: !64)
!78 = !DILocation(line: 135, column: 5, scope: !64)
!79 = !DILocation(line: 138, column: 5, scope: !64)
!80 = !DILocation(line: 139, column: 5, scope: !64)
!81 = !DILocation(line: 140, column: 5, scope: !64)
!82 = !DILocation(line: 142, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 56, type: !4)
!85 = !DILocation(line: 56, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !14, line: 57, type: !4)
!87 = !DILocation(line: 57, column: 12, scope: !83)
!88 = !DILocation(line: 57, column: 36, scope: !83)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !14, line: 58, type: !4)
!90 = !DILocation(line: 58, column: 12, scope: !83)
!91 = !DILocation(line: 58, column: 37, scope: !83)
!92 = !DILocation(line: 59, column: 12, scope: !83)
!93 = !DILocation(line: 59, column: 5, scope: !83)
!94 = !DILocation(line: 60, column: 5, scope: !83)
!95 = !DILocation(line: 60, column: 25, scope: !83)
!96 = !DILocation(line: 61, column: 12, scope: !83)
!97 = !DILocation(line: 61, column: 5, scope: !83)
!98 = !DILocation(line: 62, column: 5, scope: !83)
!99 = !DILocation(line: 62, column: 27, scope: !83)
!100 = !DILocation(line: 63, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !83, file: !14, line: 63, column: 8)
!102 = !DILocation(line: 63, column: 18, scope: !101)
!103 = !DILocation(line: 63, column: 8, scope: !83)
!104 = !DILocation(line: 66, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !14, line: 64, column: 5)
!106 = !DILocation(line: 67, column: 5, scope: !105)
!107 = !DILocation(line: 71, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !101, file: !14, line: 69, column: 5)
!109 = !DILocation(line: 71, column: 14, scope: !108)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !14, line: 74, type: !43)
!111 = distinct !DILexicalBlock(scope: !83, file: !14, line: 73, column: 5)
!112 = !DILocation(line: 74, column: 14, scope: !111)
!113 = !DILocation(line: 75, column: 9, scope: !111)
!114 = !DILocation(line: 76, column: 9, scope: !111)
!115 = !DILocation(line: 76, column: 21, scope: !111)
!116 = !DILocation(line: 79, column: 9, scope: !111)
!117 = !DILocation(line: 79, column: 22, scope: !111)
!118 = !DILocation(line: 79, column: 35, scope: !111)
!119 = !DILocation(line: 79, column: 28, scope: !111)
!120 = !DILocation(line: 79, column: 40, scope: !111)
!121 = !DILocation(line: 80, column: 9, scope: !111)
!122 = !DILocation(line: 80, column: 21, scope: !111)
!123 = !DILocation(line: 81, column: 19, scope: !111)
!124 = !DILocation(line: 81, column: 9, scope: !111)
!125 = !DILocation(line: 83, column: 1, scope: !83)
!126 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 86, type: !15, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", scope: !126, file: !14, line: 88, type: !4)
!128 = !DILocation(line: 88, column: 12, scope: !126)
!129 = !DILocalVariable(name: "dataBadBuffer", scope: !126, file: !14, line: 89, type: !4)
!130 = !DILocation(line: 89, column: 12, scope: !126)
!131 = !DILocation(line: 89, column: 36, scope: !126)
!132 = !DILocalVariable(name: "dataGoodBuffer", scope: !126, file: !14, line: 90, type: !4)
!133 = !DILocation(line: 90, column: 12, scope: !126)
!134 = !DILocation(line: 90, column: 37, scope: !126)
!135 = !DILocation(line: 91, column: 12, scope: !126)
!136 = !DILocation(line: 91, column: 5, scope: !126)
!137 = !DILocation(line: 92, column: 5, scope: !126)
!138 = !DILocation(line: 92, column: 25, scope: !126)
!139 = !DILocation(line: 93, column: 12, scope: !126)
!140 = !DILocation(line: 93, column: 5, scope: !126)
!141 = !DILocation(line: 94, column: 5, scope: !126)
!142 = !DILocation(line: 94, column: 27, scope: !126)
!143 = !DILocation(line: 95, column: 8, scope: !144)
!144 = distinct !DILexicalBlock(scope: !126, file: !14, line: 95, column: 8)
!145 = !DILocation(line: 95, column: 18, scope: !144)
!146 = !DILocation(line: 95, column: 8, scope: !126)
!147 = !DILocation(line: 98, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !14, line: 96, column: 5)
!149 = !DILocation(line: 98, column: 14, scope: !148)
!150 = !DILocation(line: 99, column: 5, scope: !148)
!151 = !DILocalVariable(name: "dest", scope: !152, file: !14, line: 101, type: !43)
!152 = distinct !DILexicalBlock(scope: !126, file: !14, line: 100, column: 5)
!153 = !DILocation(line: 101, column: 14, scope: !152)
!154 = !DILocation(line: 102, column: 9, scope: !152)
!155 = !DILocation(line: 103, column: 9, scope: !152)
!156 = !DILocation(line: 103, column: 21, scope: !152)
!157 = !DILocation(line: 106, column: 9, scope: !152)
!158 = !DILocation(line: 106, column: 22, scope: !152)
!159 = !DILocation(line: 106, column: 35, scope: !152)
!160 = !DILocation(line: 106, column: 28, scope: !152)
!161 = !DILocation(line: 106, column: 40, scope: !152)
!162 = !DILocation(line: 107, column: 9, scope: !152)
!163 = !DILocation(line: 107, column: 21, scope: !152)
!164 = !DILocation(line: 108, column: 19, scope: !152)
!165 = !DILocation(line: 108, column: 9, scope: !152)
!166 = !DILocation(line: 110, column: 1, scope: !126)
