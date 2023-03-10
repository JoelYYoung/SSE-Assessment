; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 40, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 44, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %7 = load i32*, i32** %data, align 8, !dbg !39
  call void %6(i32* %7), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65b_badSink(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #4, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #4, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !67, metadata !DIExpression()), !dbg !68
  store void (i32*)* @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 40, align 16, !dbg !71
  %1 = bitcast i8* %0 to i32*, !dbg !72
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = alloca i8, i64 44, align 16, !dbg !75
  %3 = bitcast i8* %2 to i32*, !dbg !76
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !74
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !77
  store i32* %4, i32** %data, align 8, !dbg !78
  %5 = load i32*, i32** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  %6 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !81
  %7 = load i32*, i32** %data, align 8, !dbg !82
  call void %6(i32* %7), !dbg !81
  ret void, !dbg !83
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65_bad", scope: !16, file: !16, line: 31, type: !17, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 35, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 35, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 36, type: !4)
!27 = !DILocation(line: 36, column: 15, scope: !15)
!28 = !DILocation(line: 36, column: 42, scope: !15)
!29 = !DILocation(line: 36, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 37, type: !4)
!31 = !DILocation(line: 37, column: 15, scope: !15)
!32 = !DILocation(line: 37, column: 43, scope: !15)
!33 = !DILocation(line: 37, column: 32, scope: !15)
!34 = !DILocation(line: 40, column: 12, scope: !15)
!35 = !DILocation(line: 40, column: 10, scope: !15)
!36 = !DILocation(line: 41, column: 5, scope: !15)
!37 = !DILocation(line: 41, column: 13, scope: !15)
!38 = !DILocation(line: 43, column: 5, scope: !15)
!39 = !DILocation(line: 43, column: 13, scope: !15)
!40 = !DILocation(line: 44, column: 1, scope: !15)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_65_good", scope: !16, file: !16, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 68, column: 5, scope: !41)
!43 = !DILocation(line: 69, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 81, type: !45, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!7, !7, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !16, line: 81, type: !7)
!51 = !DILocation(line: 81, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !16, line: 81, type: !47)
!53 = !DILocation(line: 81, column: 27, scope: !44)
!54 = !DILocation(line: 84, column: 22, scope: !44)
!55 = !DILocation(line: 84, column: 12, scope: !44)
!56 = !DILocation(line: 84, column: 5, scope: !44)
!57 = !DILocation(line: 86, column: 5, scope: !44)
!58 = !DILocation(line: 87, column: 5, scope: !44)
!59 = !DILocation(line: 88, column: 5, scope: !44)
!60 = !DILocation(line: 91, column: 5, scope: !44)
!61 = !DILocation(line: 92, column: 5, scope: !44)
!62 = !DILocation(line: 93, column: 5, scope: !44)
!63 = !DILocation(line: 95, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !16, line: 55, type: !4)
!66 = !DILocation(line: 55, column: 15, scope: !64)
!67 = !DILocalVariable(name: "funcPtr", scope: !64, file: !16, line: 56, type: !22)
!68 = !DILocation(line: 56, column: 12, scope: !64)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !64, file: !16, line: 57, type: !4)
!70 = !DILocation(line: 57, column: 15, scope: !64)
!71 = !DILocation(line: 57, column: 42, scope: !64)
!72 = !DILocation(line: 57, column: 31, scope: !64)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !64, file: !16, line: 58, type: !4)
!74 = !DILocation(line: 58, column: 15, scope: !64)
!75 = !DILocation(line: 58, column: 43, scope: !64)
!76 = !DILocation(line: 58, column: 32, scope: !64)
!77 = !DILocation(line: 61, column: 12, scope: !64)
!78 = !DILocation(line: 61, column: 10, scope: !64)
!79 = !DILocation(line: 62, column: 5, scope: !64)
!80 = !DILocation(line: 62, column: 13, scope: !64)
!81 = !DILocation(line: 63, column: 5, scope: !64)
!82 = !DILocation(line: 63, column: 13, scope: !64)
!83 = !DILocation(line: 64, column: 1, scope: !64)
