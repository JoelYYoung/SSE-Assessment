; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_65a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_65_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @CWE127_Buffer_Underread__malloc_char_cpy_65b_badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !28
  store i8* %call, i8** %dataBuffer, align 8, !dbg !27
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !30
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 -8, !dbg !34
  store i8* %add.ptr, i8** %data, align 8, !dbg !35
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  call void %3(i8* %4), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_65b_badSink(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_65_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #5, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #5, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE127_Buffer_Underread__malloc_char_cpy_65_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE127_Buffer_Underread__malloc_char_cpy_65_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !64, metadata !DIExpression()), !dbg !65
  store void (i8*)* @CWE127_Buffer_Underread__malloc_char_cpy_65b_goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !65
  store i8* null, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !67, metadata !DIExpression()), !dbg !69
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !70
  store i8* %call, i8** %dataBuffer, align 8, !dbg !69
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !72
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  store i8* %2, i8** %data, align 8, !dbg !76
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !77
  %4 = load i8*, i8** %data, align 8, !dbg !78
  call void %3(i8* %4), !dbg !77
  ret void, !dbg !79
}

declare dso_local void @CWE127_Buffer_Underread__malloc_char_cpy_65b_goodG2BSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_65_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_cpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 30, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 30, column: 12, scope: !13)
!24 = !DILocation(line: 31, column: 10, scope: !13)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !14, line: 33, type: !4)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!27 = !DILocation(line: 33, column: 16, scope: !26)
!28 = !DILocation(line: 33, column: 37, scope: !26)
!29 = !DILocation(line: 34, column: 16, scope: !26)
!30 = !DILocation(line: 34, column: 9, scope: !26)
!31 = !DILocation(line: 35, column: 9, scope: !26)
!32 = !DILocation(line: 35, column: 27, scope: !26)
!33 = !DILocation(line: 37, column: 16, scope: !26)
!34 = !DILocation(line: 37, column: 27, scope: !26)
!35 = !DILocation(line: 37, column: 14, scope: !26)
!36 = !DILocation(line: 40, column: 5, scope: !13)
!37 = !DILocation(line: 40, column: 13, scope: !13)
!38 = !DILocation(line: 41, column: 1, scope: !13)
!39 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_cpy_65_good", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 67, column: 5, scope: !39)
!41 = !DILocation(line: 68, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 80, type: !43, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !14, line: 80, type: !45)
!48 = !DILocation(line: 80, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !14, line: 80, type: !46)
!50 = !DILocation(line: 80, column: 27, scope: !42)
!51 = !DILocation(line: 83, column: 22, scope: !42)
!52 = !DILocation(line: 83, column: 12, scope: !42)
!53 = !DILocation(line: 83, column: 5, scope: !42)
!54 = !DILocation(line: 85, column: 5, scope: !42)
!55 = !DILocation(line: 86, column: 5, scope: !42)
!56 = !DILocation(line: 87, column: 5, scope: !42)
!57 = !DILocation(line: 90, column: 5, scope: !42)
!58 = !DILocation(line: 91, column: 5, scope: !42)
!59 = !DILocation(line: 92, column: 5, scope: !42)
!60 = !DILocation(line: 94, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocalVariable(name: "data", scope: !61, file: !14, line: 52, type: !4)
!63 = !DILocation(line: 52, column: 12, scope: !61)
!64 = !DILocalVariable(name: "funcPtr", scope: !61, file: !14, line: 53, type: !20)
!65 = !DILocation(line: 53, column: 12, scope: !61)
!66 = !DILocation(line: 54, column: 10, scope: !61)
!67 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !14, line: 56, type: !4)
!68 = distinct !DILexicalBlock(scope: !61, file: !14, line: 55, column: 5)
!69 = !DILocation(line: 56, column: 16, scope: !68)
!70 = !DILocation(line: 56, column: 37, scope: !68)
!71 = !DILocation(line: 57, column: 16, scope: !68)
!72 = !DILocation(line: 57, column: 9, scope: !68)
!73 = !DILocation(line: 58, column: 9, scope: !68)
!74 = !DILocation(line: 58, column: 27, scope: !68)
!75 = !DILocation(line: 60, column: 16, scope: !68)
!76 = !DILocation(line: 60, column: 14, scope: !68)
!77 = !DILocation(line: 62, column: 5, scope: !61)
!78 = !DILocation(line: 62, column: 13, scope: !61)
!79 = !DILocation(line: 63, column: 1, scope: !61)
