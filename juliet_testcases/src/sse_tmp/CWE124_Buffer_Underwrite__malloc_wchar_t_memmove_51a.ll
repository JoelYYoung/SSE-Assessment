; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51a.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51_bad() #0 !dbg !15 {
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
  %4 = load i32*, i32** %data, align 8, !dbg !34
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51b_badSink(i32* %4), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51b_badSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #4, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #4, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !61, metadata !DIExpression()), !dbg !62
  store i32* null, i32** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !64, metadata !DIExpression()), !dbg !66
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !67
  %0 = bitcast i8* %call to i32*, !dbg !68
  store i32* %0, i32** %dataBuffer, align 8, !dbg !66
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !69
  %call1 = call i32* @wmemset(i32* %1, i32 65, i64 99) #4, !dbg !70
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !71
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  store i32* %3, i32** %data, align 8, !dbg !74
  %4 = load i32*, i32** %data, align 8, !dbg !75
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51b_goodG2BSink(i32* %4), !dbg !76
  ret void, !dbg !77
}

declare dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51b_goodG2BSink(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51a.c", directory: "/home/joelyang/SSE-Assessment")
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
!34 = !DILocation(line: 37, column: 66, scope: !15)
!35 = !DILocation(line: 37, column: 5, scope: !15)
!36 = !DILocation(line: 38, column: 1, scope: !15)
!37 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memmove_51_good", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 64, column: 5, scope: !37)
!39 = !DILocation(line: 65, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 77, type: !41, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!7, !7, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !16, line: 77, type: !7)
!47 = !DILocation(line: 77, column: 14, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !16, line: 77, type: !43)
!49 = !DILocation(line: 77, column: 27, scope: !40)
!50 = !DILocation(line: 80, column: 22, scope: !40)
!51 = !DILocation(line: 80, column: 12, scope: !40)
!52 = !DILocation(line: 80, column: 5, scope: !40)
!53 = !DILocation(line: 82, column: 5, scope: !40)
!54 = !DILocation(line: 83, column: 5, scope: !40)
!55 = !DILocation(line: 84, column: 5, scope: !40)
!56 = !DILocation(line: 87, column: 5, scope: !40)
!57 = !DILocation(line: 88, column: 5, scope: !40)
!58 = !DILocation(line: 89, column: 5, scope: !40)
!59 = !DILocation(line: 91, column: 5, scope: !40)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !60, file: !16, line: 50, type: !4)
!62 = !DILocation(line: 50, column: 15, scope: !60)
!63 = !DILocation(line: 51, column: 10, scope: !60)
!64 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !16, line: 53, type: !4)
!65 = distinct !DILexicalBlock(scope: !60, file: !16, line: 52, column: 5)
!66 = !DILocation(line: 53, column: 19, scope: !65)
!67 = !DILocation(line: 53, column: 43, scope: !65)
!68 = !DILocation(line: 53, column: 32, scope: !65)
!69 = !DILocation(line: 54, column: 17, scope: !65)
!70 = !DILocation(line: 54, column: 9, scope: !65)
!71 = !DILocation(line: 55, column: 9, scope: !65)
!72 = !DILocation(line: 55, column: 27, scope: !65)
!73 = !DILocation(line: 57, column: 16, scope: !65)
!74 = !DILocation(line: 57, column: 14, scope: !65)
!75 = !DILocation(line: 59, column: 70, scope: !60)
!76 = !DILocation(line: 59, column: 5, scope: !60)
!77 = !DILocation(line: 60, column: 1, scope: !60)
