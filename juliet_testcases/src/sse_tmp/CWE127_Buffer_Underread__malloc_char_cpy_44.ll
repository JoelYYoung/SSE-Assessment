; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
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
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  call void %4(i8* %5), !dbg !43
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !55
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !56
  store i8 0, i8* %arrayidx, align 1, !dbg !57
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !58
  %0 = load i8*, i8** %data.addr, align 8, !dbg !59
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %0) #6, !dbg !60
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @printLine(i8* %arraydecay2), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_44_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__malloc_char_cpy_44_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__malloc_char_cpy_44_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !89, metadata !DIExpression()), !dbg !90
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !90
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
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !108
  %5 = load i8*, i8** %data, align 8, !dbg !109
  call void %4(i8* %5), !dbg !108
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !111 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !117
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !120
  %0 = load i8*, i8** %data.addr, align 8, !dbg !121
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %0) #6, !dbg !122
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !123
  call void @printLine(i8* %arraydecay2), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_44_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 41, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 41, column: 12, scope: !14)
!25 = !DILocation(line: 42, column: 10, scope: !14)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !15, line: 44, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 43, column: 5)
!28 = !DILocation(line: 44, column: 16, scope: !27)
!29 = !DILocation(line: 44, column: 37, scope: !27)
!30 = !DILocation(line: 45, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 45, column: 13)
!32 = !DILocation(line: 45, column: 24, scope: !31)
!33 = !DILocation(line: 45, column: 13, scope: !27)
!34 = !DILocation(line: 45, column: 34, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 45, column: 33)
!36 = !DILocation(line: 46, column: 16, scope: !27)
!37 = !DILocation(line: 46, column: 9, scope: !27)
!38 = !DILocation(line: 47, column: 9, scope: !27)
!39 = !DILocation(line: 47, column: 27, scope: !27)
!40 = !DILocation(line: 49, column: 16, scope: !27)
!41 = !DILocation(line: 49, column: 27, scope: !27)
!42 = !DILocation(line: 49, column: 14, scope: !27)
!43 = !DILocation(line: 52, column: 5, scope: !14)
!44 = !DILocation(line: 52, column: 13, scope: !14)
!45 = !DILocation(line: 53, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !15, line: 23, type: !4)
!48 = !DILocation(line: 23, column: 28, scope: !46)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !15, line: 26, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 25, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 200)
!54 = !DILocation(line: 26, column: 14, scope: !50)
!55 = !DILocation(line: 27, column: 9, scope: !50)
!56 = !DILocation(line: 28, column: 9, scope: !50)
!57 = !DILocation(line: 28, column: 23, scope: !50)
!58 = !DILocation(line: 30, column: 16, scope: !50)
!59 = !DILocation(line: 30, column: 22, scope: !50)
!60 = !DILocation(line: 30, column: 9, scope: !50)
!61 = !DILocation(line: 31, column: 19, scope: !50)
!62 = !DILocation(line: 31, column: 9, scope: !50)
!63 = !DILocation(line: 35, column: 1, scope: !46)
!64 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_44_good", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 92, column: 5, scope: !64)
!66 = !DILocation(line: 93, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 104, type: !68, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 104, type: !70)
!73 = !DILocation(line: 104, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 104, type: !71)
!75 = !DILocation(line: 104, column: 27, scope: !67)
!76 = !DILocation(line: 107, column: 22, scope: !67)
!77 = !DILocation(line: 107, column: 12, scope: !67)
!78 = !DILocation(line: 107, column: 5, scope: !67)
!79 = !DILocation(line: 109, column: 5, scope: !67)
!80 = !DILocation(line: 110, column: 5, scope: !67)
!81 = !DILocation(line: 111, column: 5, scope: !67)
!82 = !DILocation(line: 114, column: 5, scope: !67)
!83 = !DILocation(line: 115, column: 5, scope: !67)
!84 = !DILocation(line: 116, column: 5, scope: !67)
!85 = !DILocation(line: 118, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 76, type: !4)
!88 = !DILocation(line: 76, column: 12, scope: !86)
!89 = !DILocalVariable(name: "funcPtr", scope: !86, file: !15, line: 77, type: !21)
!90 = !DILocation(line: 77, column: 12, scope: !86)
!91 = !DILocation(line: 78, column: 10, scope: !86)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !15, line: 80, type: !4)
!93 = distinct !DILexicalBlock(scope: !86, file: !15, line: 79, column: 5)
!94 = !DILocation(line: 80, column: 16, scope: !93)
!95 = !DILocation(line: 80, column: 37, scope: !93)
!96 = !DILocation(line: 81, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 81, column: 13)
!98 = !DILocation(line: 81, column: 24, scope: !97)
!99 = !DILocation(line: 81, column: 13, scope: !93)
!100 = !DILocation(line: 81, column: 34, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 81, column: 33)
!102 = !DILocation(line: 82, column: 16, scope: !93)
!103 = !DILocation(line: 82, column: 9, scope: !93)
!104 = !DILocation(line: 83, column: 9, scope: !93)
!105 = !DILocation(line: 83, column: 27, scope: !93)
!106 = !DILocation(line: 85, column: 16, scope: !93)
!107 = !DILocation(line: 85, column: 14, scope: !93)
!108 = !DILocation(line: 87, column: 5, scope: !86)
!109 = !DILocation(line: 87, column: 13, scope: !86)
!110 = !DILocation(line: 88, column: 1, scope: !86)
!111 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 60, type: !22, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", arg: 1, scope: !111, file: !15, line: 60, type: !4)
!113 = !DILocation(line: 60, column: 32, scope: !111)
!114 = !DILocalVariable(name: "dest", scope: !115, file: !15, line: 63, type: !51)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 62, column: 5)
!116 = !DILocation(line: 63, column: 14, scope: !115)
!117 = !DILocation(line: 64, column: 9, scope: !115)
!118 = !DILocation(line: 65, column: 9, scope: !115)
!119 = !DILocation(line: 65, column: 23, scope: !115)
!120 = !DILocation(line: 67, column: 16, scope: !115)
!121 = !DILocation(line: 67, column: 22, scope: !115)
!122 = !DILocation(line: 67, column: 9, scope: !115)
!123 = !DILocation(line: 68, column: 19, scope: !115)
!124 = !DILocation(line: 68, column: 9, scope: !115)
!125 = !DILocation(line: 72, column: 1, scope: !111)
