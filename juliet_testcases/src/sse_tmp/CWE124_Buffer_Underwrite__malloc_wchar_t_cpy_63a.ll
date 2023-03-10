; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63a.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %dataBuffer, align 8, !dbg !24
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !28
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !31
  %add.ptr = getelementptr inbounds i32, i32* %3, i64 -8, !dbg !32
  store i32* %add.ptr, i32** %data, align 8, !dbg !33
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63b_badSink(i32** %data), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63b_badSink(i32**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63_good() #0 !dbg !36 {
entry:
  call void @goodG2B(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #4, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #4, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !60, metadata !DIExpression()), !dbg !61
  store i32* null, i32** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !63, metadata !DIExpression()), !dbg !65
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !66
  %0 = bitcast i8* %call to i32*, !dbg !67
  store i32* %0, i32** %dataBuffer, align 8, !dbg !65
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !68
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !69
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !70
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !70
  store i32 0, i32* %arrayidx, align 4, !dbg !71
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  store i32* %3, i32** %data, align 8, !dbg !73
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63b_goodG2BSink(i32** %data), !dbg !74
  ret void, !dbg !75
}

declare dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63b_goodG2BSink(i32**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocation(line: 29, column: 10, scope: !15)
!22 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !16, line: 31, type: !4)
!23 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!24 = !DILocation(line: 31, column: 19, scope: !23)
!25 = !DILocation(line: 31, column: 43, scope: !23)
!26 = !DILocation(line: 31, column: 32, scope: !23)
!27 = !DILocation(line: 32, column: 17, scope: !23)
!28 = !DILocation(line: 32, column: 9, scope: !23)
!29 = !DILocation(line: 33, column: 9, scope: !23)
!30 = !DILocation(line: 33, column: 27, scope: !23)
!31 = !DILocation(line: 35, column: 16, scope: !23)
!32 = !DILocation(line: 35, column: 27, scope: !23)
!33 = !DILocation(line: 35, column: 14, scope: !23)
!34 = !DILocation(line: 37, column: 5, scope: !15)
!35 = !DILocation(line: 38, column: 1, scope: !15)
!36 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_63_good", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 63, column: 5, scope: !36)
!38 = !DILocation(line: 64, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 76, type: !40, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!7, !7, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !16, line: 76, type: !7)
!46 = !DILocation(line: 76, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !16, line: 76, type: !42)
!48 = !DILocation(line: 76, column: 27, scope: !39)
!49 = !DILocation(line: 79, column: 22, scope: !39)
!50 = !DILocation(line: 79, column: 12, scope: !39)
!51 = !DILocation(line: 79, column: 5, scope: !39)
!52 = !DILocation(line: 81, column: 5, scope: !39)
!53 = !DILocation(line: 82, column: 5, scope: !39)
!54 = !DILocation(line: 83, column: 5, scope: !39)
!55 = !DILocation(line: 86, column: 5, scope: !39)
!56 = !DILocation(line: 87, column: 5, scope: !39)
!57 = !DILocation(line: 88, column: 5, scope: !39)
!58 = !DILocation(line: 90, column: 5, scope: !39)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !16, line: 49, type: !4)
!61 = !DILocation(line: 49, column: 15, scope: !59)
!62 = !DILocation(line: 50, column: 10, scope: !59)
!63 = !DILocalVariable(name: "dataBuffer", scope: !64, file: !16, line: 52, type: !4)
!64 = distinct !DILexicalBlock(scope: !59, file: !16, line: 51, column: 5)
!65 = !DILocation(line: 52, column: 19, scope: !64)
!66 = !DILocation(line: 52, column: 43, scope: !64)
!67 = !DILocation(line: 52, column: 32, scope: !64)
!68 = !DILocation(line: 53, column: 17, scope: !64)
!69 = !DILocation(line: 53, column: 9, scope: !64)
!70 = !DILocation(line: 54, column: 9, scope: !64)
!71 = !DILocation(line: 54, column: 27, scope: !64)
!72 = !DILocation(line: 56, column: 16, scope: !64)
!73 = !DILocation(line: 56, column: 14, scope: !64)
!74 = !DILocation(line: 58, column: 5, scope: !59)
!75 = !DILocation(line: 59, column: 1, scope: !59)
