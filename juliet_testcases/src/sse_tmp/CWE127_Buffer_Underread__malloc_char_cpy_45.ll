; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_char_cpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__malloc_char_cpy_45_goodG2BData = internal global i8* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !29
  store i8* %call, i8** %dataBuffer, align 8, !dbg !28
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !37
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !41
  store i8* %add.ptr, i8** %data, align 8, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  store i8* %4, i8** @CWE127_Buffer_Underread__malloc_char_cpy_45_badData, align 8, !dbg !44
  call void @badSink(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_45_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE127_Buffer_Underread__malloc_char_cpy_45_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE127_Buffer_Underread__malloc_char_cpy_45_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i8*, i8** @CWE127_Buffer_Underread__malloc_char_cpy_45_badData, align 8, !dbg !72
  store i8* %0, i8** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !73, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !79
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !82
  %1 = load i8*, i8** %data, align 8, !dbg !83
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %1) #6, !dbg !84
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !85
  call void @printLine(i8* %arraydecay2), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i8* null, i8** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !94
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !95
  store i8* %call, i8** %dataBuffer, align 8, !dbg !94
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq i8* %0, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !103
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  store i8* %3, i8** %data, align 8, !dbg !107
  %4 = load i8*, i8** %data, align 8, !dbg !108
  store i8* %4, i8** @CWE127_Buffer_Underread__malloc_char_cpy_45_goodG2BData, align 8, !dbg !109
  call void @goodG2BSink(), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load i8*, i8** @CWE127_Buffer_Underread__malloc_char_cpy_45_goodG2BData, align 8, !dbg !115
  store i8* %0, i8** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !119
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !122
  %1 = load i8*, i8** %data, align 8, !dbg !123
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %1) #6, !dbg !124
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @printLine(i8* %arraydecay2), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_cpy_45_badData", scope: !2, file: !13, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_char_cpy_45_goodG2BData", scope: !2, file: !13, line: 22, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_45_bad", scope: !13, file: !13, line: 41, type: !21, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 43, type: !6)
!24 = !DILocation(line: 43, column: 12, scope: !20)
!25 = !DILocation(line: 44, column: 10, scope: !20)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !13, line: 46, type: !6)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 45, column: 5)
!28 = !DILocation(line: 46, column: 16, scope: !27)
!29 = !DILocation(line: 46, column: 37, scope: !27)
!30 = !DILocation(line: 47, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 47, column: 13)
!32 = !DILocation(line: 47, column: 24, scope: !31)
!33 = !DILocation(line: 47, column: 13, scope: !27)
!34 = !DILocation(line: 47, column: 34, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 47, column: 33)
!36 = !DILocation(line: 48, column: 16, scope: !27)
!37 = !DILocation(line: 48, column: 9, scope: !27)
!38 = !DILocation(line: 49, column: 9, scope: !27)
!39 = !DILocation(line: 49, column: 27, scope: !27)
!40 = !DILocation(line: 51, column: 16, scope: !27)
!41 = !DILocation(line: 51, column: 27, scope: !27)
!42 = !DILocation(line: 51, column: 14, scope: !27)
!43 = !DILocation(line: 53, column: 59, scope: !20)
!44 = !DILocation(line: 53, column: 57, scope: !20)
!45 = !DILocation(line: 54, column: 5, scope: !20)
!46 = !DILocation(line: 55, column: 1, scope: !20)
!47 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_45_good", scope: !13, file: !13, line: 93, type: !21, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DILocation(line: 95, column: 5, scope: !47)
!49 = !DILocation(line: 96, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 107, type: !51, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !13, line: 107, type: !53)
!56 = !DILocation(line: 107, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !13, line: 107, type: !54)
!58 = !DILocation(line: 107, column: 27, scope: !50)
!59 = !DILocation(line: 110, column: 22, scope: !50)
!60 = !DILocation(line: 110, column: 12, scope: !50)
!61 = !DILocation(line: 110, column: 5, scope: !50)
!62 = !DILocation(line: 112, column: 5, scope: !50)
!63 = !DILocation(line: 113, column: 5, scope: !50)
!64 = !DILocation(line: 114, column: 5, scope: !50)
!65 = !DILocation(line: 117, column: 5, scope: !50)
!66 = !DILocation(line: 118, column: 5, scope: !50)
!67 = !DILocation(line: 119, column: 5, scope: !50)
!68 = !DILocation(line: 121, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocalVariable(name: "data", scope: !69, file: !13, line: 28, type: !6)
!71 = !DILocation(line: 28, column: 12, scope: !69)
!72 = !DILocation(line: 28, column: 19, scope: !69)
!73 = !DILocalVariable(name: "dest", scope: !74, file: !13, line: 30, type: !75)
!74 = distinct !DILexicalBlock(scope: !69, file: !13, line: 29, column: 5)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 200)
!78 = !DILocation(line: 30, column: 14, scope: !74)
!79 = !DILocation(line: 31, column: 9, scope: !74)
!80 = !DILocation(line: 32, column: 9, scope: !74)
!81 = !DILocation(line: 32, column: 23, scope: !74)
!82 = !DILocation(line: 34, column: 16, scope: !74)
!83 = !DILocation(line: 34, column: 22, scope: !74)
!84 = !DILocation(line: 34, column: 9, scope: !74)
!85 = !DILocation(line: 35, column: 19, scope: !74)
!86 = !DILocation(line: 35, column: 9, scope: !74)
!87 = !DILocation(line: 39, column: 1, scope: !69)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 77, type: !21, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !13, line: 79, type: !6)
!90 = !DILocation(line: 79, column: 12, scope: !88)
!91 = !DILocation(line: 80, column: 10, scope: !88)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !13, line: 82, type: !6)
!93 = distinct !DILexicalBlock(scope: !88, file: !13, line: 81, column: 5)
!94 = !DILocation(line: 82, column: 16, scope: !93)
!95 = !DILocation(line: 82, column: 37, scope: !93)
!96 = !DILocation(line: 83, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !13, line: 83, column: 13)
!98 = !DILocation(line: 83, column: 24, scope: !97)
!99 = !DILocation(line: 83, column: 13, scope: !93)
!100 = !DILocation(line: 83, column: 34, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !13, line: 83, column: 33)
!102 = !DILocation(line: 84, column: 16, scope: !93)
!103 = !DILocation(line: 84, column: 9, scope: !93)
!104 = !DILocation(line: 85, column: 9, scope: !93)
!105 = !DILocation(line: 85, column: 27, scope: !93)
!106 = !DILocation(line: 87, column: 16, scope: !93)
!107 = !DILocation(line: 87, column: 14, scope: !93)
!108 = !DILocation(line: 89, column: 63, scope: !88)
!109 = !DILocation(line: 89, column: 61, scope: !88)
!110 = !DILocation(line: 90, column: 5, scope: !88)
!111 = !DILocation(line: 91, column: 1, scope: !88)
!112 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 62, type: !21, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !13, line: 64, type: !6)
!114 = !DILocation(line: 64, column: 12, scope: !112)
!115 = !DILocation(line: 64, column: 19, scope: !112)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !13, line: 66, type: !75)
!117 = distinct !DILexicalBlock(scope: !112, file: !13, line: 65, column: 5)
!118 = !DILocation(line: 66, column: 14, scope: !117)
!119 = !DILocation(line: 67, column: 9, scope: !117)
!120 = !DILocation(line: 68, column: 9, scope: !117)
!121 = !DILocation(line: 68, column: 23, scope: !117)
!122 = !DILocation(line: 70, column: 16, scope: !117)
!123 = !DILocation(line: 70, column: 22, scope: !117)
!124 = !DILocation(line: 70, column: 9, scope: !117)
!125 = !DILocation(line: 71, column: 19, scope: !117)
!126 = !DILocation(line: 71, column: 9, scope: !117)
!127 = !DILocation(line: 75, column: 1, scope: !112)
