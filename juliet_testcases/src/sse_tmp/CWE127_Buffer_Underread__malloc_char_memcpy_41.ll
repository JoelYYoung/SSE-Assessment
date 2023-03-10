; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memcpy_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !29
  %0 = load i8*, i8** %data.addr, align 8, !dbg !30
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 100, i1 false), !dbg !29
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx2, align 1, !dbg !32
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  call void @printLine(i8* %arraydecay3), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memcpy_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !39, metadata !DIExpression()), !dbg !40
  store i8* null, i8** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !42, metadata !DIExpression()), !dbg !44
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !45
  store i8* %call, i8** %dataBuffer, align 8, !dbg !44
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !46
  %cmp = icmp eq i8* %0, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !50
  unreachable, !dbg !50

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !53
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !54
  store i8 0, i8* %arrayidx, align 1, !dbg !55
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !56
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !57
  store i8* %add.ptr, i8** %data, align 8, !dbg !58
  %4 = load i8*, i8** %data, align 8, !dbg !59
  call void @CWE127_Buffer_Underread__malloc_char_memcpy_41_badSink(i8* %4), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memcpy_41_goodG2BSink(i8* %data) #0 !dbg !62 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !65, metadata !DIExpression()), !dbg !67
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !68
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !71
  %0 = load i8*, i8** %data.addr, align 8, !dbg !72
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 100, i1 false), !dbg !71
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !73
  store i8 0, i8* %arrayidx2, align 1, !dbg !74
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !75
  call void @printLine(i8* %arraydecay3), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memcpy_41_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #7, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #7, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE127_Buffer_Underread__malloc_char_memcpy_41_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE127_Buffer_Underread__malloc_char_memcpy_41_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* null, i8** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !107
  store i8* %call, i8** %dataBuffer, align 8, !dbg !106
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  %cmp = icmp eq i8* %0, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !115
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !118
  store i8* %3, i8** %data, align 8, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  call void @CWE127_Buffer_Underread__malloc_char_memcpy_41_goodG2BSink(i8* %4), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memcpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 68, scope: !14)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 21, scope: !21)
!29 = !DILocation(line: 30, column: 9, scope: !21)
!30 = !DILocation(line: 30, column: 22, scope: !21)
!31 = !DILocation(line: 32, column: 9, scope: !21)
!32 = !DILocation(line: 32, column: 21, scope: !21)
!33 = !DILocation(line: 33, column: 19, scope: !21)
!34 = !DILocation(line: 33, column: 9, scope: !21)
!35 = !DILocation(line: 37, column: 1, scope: !14)
!36 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memcpy_41_bad", scope: !15, file: !15, line: 39, type: !37, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !15, line: 41, type: !4)
!40 = !DILocation(line: 41, column: 12, scope: !36)
!41 = !DILocation(line: 42, column: 10, scope: !36)
!42 = !DILocalVariable(name: "dataBuffer", scope: !43, file: !15, line: 44, type: !4)
!43 = distinct !DILexicalBlock(scope: !36, file: !15, line: 43, column: 5)
!44 = !DILocation(line: 44, column: 16, scope: !43)
!45 = !DILocation(line: 44, column: 37, scope: !43)
!46 = !DILocation(line: 45, column: 13, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 45, column: 13)
!48 = !DILocation(line: 45, column: 24, scope: !47)
!49 = !DILocation(line: 45, column: 13, scope: !43)
!50 = !DILocation(line: 45, column: 34, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !15, line: 45, column: 33)
!52 = !DILocation(line: 46, column: 16, scope: !43)
!53 = !DILocation(line: 46, column: 9, scope: !43)
!54 = !DILocation(line: 47, column: 9, scope: !43)
!55 = !DILocation(line: 47, column: 27, scope: !43)
!56 = !DILocation(line: 49, column: 16, scope: !43)
!57 = !DILocation(line: 49, column: 27, scope: !43)
!58 = !DILocation(line: 49, column: 14, scope: !43)
!59 = !DILocation(line: 51, column: 60, scope: !36)
!60 = !DILocation(line: 51, column: 5, scope: !36)
!61 = !DILocation(line: 52, column: 1, scope: !36)
!62 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memcpy_41_goodG2BSink", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !15, line: 58, type: !4)
!64 = !DILocation(line: 58, column: 72, scope: !62)
!65 = !DILocalVariable(name: "dest", scope: !66, file: !15, line: 61, type: !22)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 60, column: 5)
!67 = !DILocation(line: 61, column: 14, scope: !66)
!68 = !DILocation(line: 62, column: 9, scope: !66)
!69 = !DILocation(line: 63, column: 9, scope: !66)
!70 = !DILocation(line: 63, column: 21, scope: !66)
!71 = !DILocation(line: 65, column: 9, scope: !66)
!72 = !DILocation(line: 65, column: 22, scope: !66)
!73 = !DILocation(line: 67, column: 9, scope: !66)
!74 = !DILocation(line: 67, column: 21, scope: !66)
!75 = !DILocation(line: 68, column: 19, scope: !66)
!76 = !DILocation(line: 68, column: 9, scope: !66)
!77 = !DILocation(line: 72, column: 1, scope: !62)
!78 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memcpy_41_good", scope: !15, file: !15, line: 90, type: !37, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 92, column: 5, scope: !78)
!80 = !DILocation(line: 93, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !82, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !15, line: 105, type: !84)
!87 = !DILocation(line: 105, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !15, line: 105, type: !85)
!89 = !DILocation(line: 105, column: 27, scope: !81)
!90 = !DILocation(line: 108, column: 22, scope: !81)
!91 = !DILocation(line: 108, column: 12, scope: !81)
!92 = !DILocation(line: 108, column: 5, scope: !81)
!93 = !DILocation(line: 110, column: 5, scope: !81)
!94 = !DILocation(line: 111, column: 5, scope: !81)
!95 = !DILocation(line: 112, column: 5, scope: !81)
!96 = !DILocation(line: 115, column: 5, scope: !81)
!97 = !DILocation(line: 116, column: 5, scope: !81)
!98 = !DILocation(line: 117, column: 5, scope: !81)
!99 = !DILocation(line: 119, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 75, type: !37, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 77, type: !4)
!102 = !DILocation(line: 77, column: 12, scope: !100)
!103 = !DILocation(line: 78, column: 10, scope: !100)
!104 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !15, line: 80, type: !4)
!105 = distinct !DILexicalBlock(scope: !100, file: !15, line: 79, column: 5)
!106 = !DILocation(line: 80, column: 16, scope: !105)
!107 = !DILocation(line: 80, column: 37, scope: !105)
!108 = !DILocation(line: 81, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 81, column: 13)
!110 = !DILocation(line: 81, column: 24, scope: !109)
!111 = !DILocation(line: 81, column: 13, scope: !105)
!112 = !DILocation(line: 81, column: 34, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 81, column: 33)
!114 = !DILocation(line: 82, column: 16, scope: !105)
!115 = !DILocation(line: 82, column: 9, scope: !105)
!116 = !DILocation(line: 83, column: 9, scope: !105)
!117 = !DILocation(line: 83, column: 27, scope: !105)
!118 = !DILocation(line: 85, column: 16, scope: !105)
!119 = !DILocation(line: 85, column: 14, scope: !105)
!120 = !DILocation(line: 87, column: 64, scope: !100)
!121 = !DILocation(line: 87, column: 5, scope: !100)
!122 = !DILocation(line: 88, column: 1, scope: !100)
