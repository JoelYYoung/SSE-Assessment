; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61b_badSource(i32* %3), !dbg !28
  store i32* %call, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !36
  %5 = bitcast i32* %arraydecay to i8*, !dbg !36
  %6 = load i32*, i32** %data, align 8, !dbg !37
  %call1 = call i64 @wcslen(i32* %6) #6, !dbg !38
  %7 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %5, i64 %call1, i8* bitcast ([3 x i32]* @.str to i8*), i32* %7) #7, !dbg !40
  %8 = load i32*, i32** %data, align 8, !dbg !41
  call void @printWLine(i32* %8), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #7, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #7, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 400, align 16, !dbg !72
  %1 = bitcast i8* %0 to i32*, !dbg !73
  store i32* %1, i32** %dataBuffer, align 8, !dbg !71
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  store i32* %2, i32** %data, align 8, !dbg !75
  %3 = load i32*, i32** %data, align 8, !dbg !76
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61b_goodG2BSource(i32* %3), !dbg !77
  store i32* %call, i32** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !79, metadata !DIExpression()), !dbg !81
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !81
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !82
  %5 = bitcast i32* %arraydecay to i8*, !dbg !82
  %6 = load i32*, i32** %data, align 8, !dbg !83
  %call1 = call i64 @wcslen(i32* %6) #6, !dbg !84
  %7 = load i32*, i32** %data, align 8, !dbg !85
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %5, i64 %call1, i8* bitcast ([3 x i32]* @.str to i8*), i32* %7) #7, !dbg !86
  %8 = load i32*, i32** %data, align 8, !dbg !87
  call void @printWLine(i32* %8), !dbg !88
  ret void, !dbg !89
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61_bad", scope: !16, file: !16, line: 32, type: !17, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 34, type: !4)
!20 = !DILocation(line: 34, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 35, type: !4)
!22 = !DILocation(line: 35, column: 15, scope: !15)
!23 = !DILocation(line: 35, column: 39, scope: !15)
!24 = !DILocation(line: 35, column: 28, scope: !15)
!25 = !DILocation(line: 36, column: 12, scope: !15)
!26 = !DILocation(line: 36, column: 10, scope: !15)
!27 = !DILocation(line: 37, column: 93, scope: !15)
!28 = !DILocation(line: 37, column: 12, scope: !15)
!29 = !DILocation(line: 37, column: 10, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 39, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 39, column: 17, scope: !31)
!36 = !DILocation(line: 41, column: 18, scope: !31)
!37 = !DILocation(line: 41, column: 31, scope: !31)
!38 = !DILocation(line: 41, column: 24, scope: !31)
!39 = !DILocation(line: 41, column: 45, scope: !31)
!40 = !DILocation(line: 41, column: 9, scope: !31)
!41 = !DILocation(line: 42, column: 20, scope: !31)
!42 = !DILocation(line: 42, column: 9, scope: !31)
!43 = !DILocation(line: 44, column: 1, scope: !15)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_61_good", scope: !16, file: !16, line: 67, type: !17, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 69, column: 5, scope: !44)
!46 = !DILocation(line: 70, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 82, type: !48, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!7, !7, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !16, line: 82, type: !7)
!54 = !DILocation(line: 82, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !16, line: 82, type: !50)
!56 = !DILocation(line: 82, column: 27, scope: !47)
!57 = !DILocation(line: 85, column: 22, scope: !47)
!58 = !DILocation(line: 85, column: 12, scope: !47)
!59 = !DILocation(line: 85, column: 5, scope: !47)
!60 = !DILocation(line: 87, column: 5, scope: !47)
!61 = !DILocation(line: 88, column: 5, scope: !47)
!62 = !DILocation(line: 89, column: 5, scope: !47)
!63 = !DILocation(line: 92, column: 5, scope: !47)
!64 = !DILocation(line: 93, column: 5, scope: !47)
!65 = !DILocation(line: 94, column: 5, scope: !47)
!66 = !DILocation(line: 96, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !16, line: 55, type: !4)
!69 = !DILocation(line: 55, column: 15, scope: !67)
!70 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !16, line: 56, type: !4)
!71 = !DILocation(line: 56, column: 15, scope: !67)
!72 = !DILocation(line: 56, column: 39, scope: !67)
!73 = !DILocation(line: 56, column: 28, scope: !67)
!74 = !DILocation(line: 57, column: 12, scope: !67)
!75 = !DILocation(line: 57, column: 10, scope: !67)
!76 = !DILocation(line: 58, column: 97, scope: !67)
!77 = !DILocation(line: 58, column: 12, scope: !67)
!78 = !DILocation(line: 58, column: 10, scope: !67)
!79 = !DILocalVariable(name: "dest", scope: !80, file: !16, line: 60, type: !32)
!80 = distinct !DILexicalBlock(scope: !67, file: !16, line: 59, column: 5)
!81 = !DILocation(line: 60, column: 17, scope: !80)
!82 = !DILocation(line: 62, column: 18, scope: !80)
!83 = !DILocation(line: 62, column: 31, scope: !80)
!84 = !DILocation(line: 62, column: 24, scope: !80)
!85 = !DILocation(line: 62, column: 45, scope: !80)
!86 = !DILocation(line: 62, column: 9, scope: !80)
!87 = !DILocation(line: 63, column: 20, scope: !80)
!88 = !DILocation(line: 63, column: 9, scope: !80)
!89 = !DILocation(line: 65, column: 1, scope: !67)
