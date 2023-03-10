; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_01.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memcpy_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !24
  store i8* %call, i8** %dataBuffer, align 8, !dbg !23
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx1, align 1, !dbg !46
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %4, i64 100, i1 false), !dbg !47
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx3, align 1, !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @printLine(i8* %arraydecay4), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_memcpy_01_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__malloc_char_memcpy_01_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__malloc_char_memcpy_01_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* null, i8** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !83
  store i8* %call, i8** %dataBuffer, align 8, !dbg !82
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !91
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  store i8* %3, i8** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx1, align 1, !dbg !101
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  %4 = load i8*, i8** %data, align 8, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %4, i64 100, i1 false), !dbg !102
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx3, align 1, !dbg !105
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  call void @printLine(i8* %arraydecay4), !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memcpy_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memcpy_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !15, line: 28, type: !4)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 5)
!23 = !DILocation(line: 28, column: 16, scope: !22)
!24 = !DILocation(line: 28, column: 37, scope: !22)
!25 = !DILocation(line: 29, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 29, column: 13)
!27 = !DILocation(line: 29, column: 24, scope: !26)
!28 = !DILocation(line: 29, column: 13, scope: !22)
!29 = !DILocation(line: 29, column: 34, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 33)
!31 = !DILocation(line: 30, column: 16, scope: !22)
!32 = !DILocation(line: 30, column: 9, scope: !22)
!33 = !DILocation(line: 31, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 27, scope: !22)
!35 = !DILocation(line: 33, column: 16, scope: !22)
!36 = !DILocation(line: 33, column: 27, scope: !22)
!37 = !DILocation(line: 33, column: 14, scope: !22)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 36, column: 14, scope: !39)
!44 = !DILocation(line: 37, column: 9, scope: !39)
!45 = !DILocation(line: 38, column: 9, scope: !39)
!46 = !DILocation(line: 38, column: 21, scope: !39)
!47 = !DILocation(line: 40, column: 9, scope: !39)
!48 = !DILocation(line: 40, column: 22, scope: !39)
!49 = !DILocation(line: 42, column: 9, scope: !39)
!50 = !DILocation(line: 42, column: 21, scope: !39)
!51 = !DILocation(line: 43, column: 19, scope: !39)
!52 = !DILocation(line: 43, column: 9, scope: !39)
!53 = !DILocation(line: 47, column: 1, scope: !14)
!54 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memcpy_01_good", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 82, column: 5, scope: !54)
!56 = !DILocation(line: 83, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 95, type: !58, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !15, line: 95, type: !60)
!63 = !DILocation(line: 95, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !15, line: 95, type: !61)
!65 = !DILocation(line: 95, column: 27, scope: !57)
!66 = !DILocation(line: 98, column: 22, scope: !57)
!67 = !DILocation(line: 98, column: 12, scope: !57)
!68 = !DILocation(line: 98, column: 5, scope: !57)
!69 = !DILocation(line: 100, column: 5, scope: !57)
!70 = !DILocation(line: 101, column: 5, scope: !57)
!71 = !DILocation(line: 102, column: 5, scope: !57)
!72 = !DILocation(line: 105, column: 5, scope: !57)
!73 = !DILocation(line: 106, column: 5, scope: !57)
!74 = !DILocation(line: 107, column: 5, scope: !57)
!75 = !DILocation(line: 109, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 56, type: !4)
!78 = !DILocation(line: 56, column: 12, scope: !76)
!79 = !DILocation(line: 57, column: 10, scope: !76)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !15, line: 59, type: !4)
!81 = distinct !DILexicalBlock(scope: !76, file: !15, line: 58, column: 5)
!82 = !DILocation(line: 59, column: 16, scope: !81)
!83 = !DILocation(line: 59, column: 37, scope: !81)
!84 = !DILocation(line: 60, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 60, column: 13)
!86 = !DILocation(line: 60, column: 24, scope: !85)
!87 = !DILocation(line: 60, column: 13, scope: !81)
!88 = !DILocation(line: 60, column: 34, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 60, column: 33)
!90 = !DILocation(line: 61, column: 16, scope: !81)
!91 = !DILocation(line: 61, column: 9, scope: !81)
!92 = !DILocation(line: 62, column: 9, scope: !81)
!93 = !DILocation(line: 62, column: 27, scope: !81)
!94 = !DILocation(line: 64, column: 16, scope: !81)
!95 = !DILocation(line: 64, column: 14, scope: !81)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !15, line: 67, type: !40)
!97 = distinct !DILexicalBlock(scope: !76, file: !15, line: 66, column: 5)
!98 = !DILocation(line: 67, column: 14, scope: !97)
!99 = !DILocation(line: 68, column: 9, scope: !97)
!100 = !DILocation(line: 69, column: 9, scope: !97)
!101 = !DILocation(line: 69, column: 21, scope: !97)
!102 = !DILocation(line: 71, column: 9, scope: !97)
!103 = !DILocation(line: 71, column: 22, scope: !97)
!104 = !DILocation(line: 73, column: 9, scope: !97)
!105 = !DILocation(line: 73, column: 21, scope: !97)
!106 = !DILocation(line: 74, column: 19, scope: !97)
!107 = !DILocation(line: 74, column: 9, scope: !97)
!108 = !DILocation(line: 78, column: 1, scope: !76)
