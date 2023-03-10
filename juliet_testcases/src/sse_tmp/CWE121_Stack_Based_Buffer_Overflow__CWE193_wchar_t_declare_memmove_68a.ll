; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_goodG2BData = dso_local global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_badData, align 8, !dbg !41
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_badSink(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_good() #0 !dbg !44 {
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
  %call = call i64 @time(i64* null) #4, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #4, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !74
  store i32* %arraydecay, i32** %data, align 8, !dbg !75
  %0 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  %1 = load i32*, i32** %data, align 8, !dbg !78
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_goodG2BData, align 8, !dbg !79
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_goodG2BSink(), !dbg !80
  ret void, !dbg !81
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_badData", scope: !2, file: !10, line: 26, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_goodG2BData", scope: !2, file: !10, line: 27, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_bad", scope: !10, file: !10, line: 34, type: !22, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 36, type: !11)
!25 = !DILocation(line: 36, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !10, line: 37, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 37, column: 13, scope: !21)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !10, line: 38, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 38, column: 13, scope: !21)
!36 = !DILocation(line: 41, column: 12, scope: !21)
!37 = !DILocation(line: 41, column: 10, scope: !21)
!38 = !DILocation(line: 42, column: 5, scope: !21)
!39 = !DILocation(line: 42, column: 13, scope: !21)
!40 = !DILocation(line: 43, column: 85, scope: !21)
!41 = !DILocation(line: 43, column: 83, scope: !21)
!42 = !DILocation(line: 44, column: 5, scope: !21)
!43 = !DILocation(line: 45, column: 1, scope: !21)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_68_good", scope: !10, file: !10, line: 68, type: !22, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 70, column: 5, scope: !44)
!46 = !DILocation(line: 71, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 83, type: !48, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!14, !14, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !10, line: 83, type: !14)
!54 = !DILocation(line: 83, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !10, line: 83, type: !50)
!56 = !DILocation(line: 83, column: 27, scope: !47)
!57 = !DILocation(line: 86, column: 22, scope: !47)
!58 = !DILocation(line: 86, column: 12, scope: !47)
!59 = !DILocation(line: 86, column: 5, scope: !47)
!60 = !DILocation(line: 88, column: 5, scope: !47)
!61 = !DILocation(line: 89, column: 5, scope: !47)
!62 = !DILocation(line: 90, column: 5, scope: !47)
!63 = !DILocation(line: 93, column: 5, scope: !47)
!64 = !DILocation(line: 94, column: 5, scope: !47)
!65 = !DILocation(line: 95, column: 5, scope: !47)
!66 = !DILocation(line: 97, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 55, type: !22, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 57, type: !11)
!69 = !DILocation(line: 57, column: 15, scope: !67)
!70 = !DILocalVariable(name: "dataBadBuffer", scope: !67, file: !10, line: 58, type: !27)
!71 = !DILocation(line: 58, column: 13, scope: !67)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !67, file: !10, line: 59, type: !32)
!73 = !DILocation(line: 59, column: 13, scope: !67)
!74 = !DILocation(line: 62, column: 12, scope: !67)
!75 = !DILocation(line: 62, column: 10, scope: !67)
!76 = !DILocation(line: 63, column: 5, scope: !67)
!77 = !DILocation(line: 63, column: 13, scope: !67)
!78 = !DILocation(line: 64, column: 89, scope: !67)
!79 = !DILocation(line: 64, column: 87, scope: !67)
!80 = !DILocation(line: 65, column: 5, scope: !67)
!81 = !DILocation(line: 66, column: 1, scope: !67)
