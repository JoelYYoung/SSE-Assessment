; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_goodG2BData = dso_local global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #4, !dbg !34
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %2 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_badData, align 8, !dbg !38
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68b_badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_good() #0 !dbg !41 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !69
  store i32* %arraydecay, i32** %data, align 8, !dbg !70
  %0 = load i32*, i32** %data, align 8, !dbg !71
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #4, !dbg !72
  %1 = load i32*, i32** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %2 = load i32*, i32** %data, align 8, !dbg !75
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_goodG2BData, align 8, !dbg !76
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68b_goodG2BSink(), !dbg !77
  ret void, !dbg !78
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
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
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_bad", scope: !10, file: !10, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 31, type: !11)
!25 = !DILocation(line: 31, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !10, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 32, column: 13, scope: !21)
!31 = !DILocation(line: 33, column: 12, scope: !21)
!32 = !DILocation(line: 33, column: 10, scope: !21)
!33 = !DILocation(line: 35, column: 13, scope: !21)
!34 = !DILocation(line: 35, column: 5, scope: !21)
!35 = !DILocation(line: 36, column: 5, scope: !21)
!36 = !DILocation(line: 36, column: 17, scope: !21)
!37 = !DILocation(line: 37, column: 78, scope: !21)
!38 = !DILocation(line: 37, column: 76, scope: !21)
!39 = !DILocation(line: 38, column: 5, scope: !21)
!40 = !DILocation(line: 39, column: 1, scope: !21)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cpy_68_good", scope: !10, file: !10, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 63, column: 5, scope: !41)
!43 = !DILocation(line: 64, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 76, type: !45, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!14, !14, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !10, line: 76, type: !14)
!51 = !DILocation(line: 76, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !10, line: 76, type: !47)
!53 = !DILocation(line: 76, column: 27, scope: !44)
!54 = !DILocation(line: 79, column: 22, scope: !44)
!55 = !DILocation(line: 79, column: 12, scope: !44)
!56 = !DILocation(line: 79, column: 5, scope: !44)
!57 = !DILocation(line: 81, column: 5, scope: !44)
!58 = !DILocation(line: 82, column: 5, scope: !44)
!59 = !DILocation(line: 83, column: 5, scope: !44)
!60 = !DILocation(line: 86, column: 5, scope: !44)
!61 = !DILocation(line: 87, column: 5, scope: !44)
!62 = !DILocation(line: 88, column: 5, scope: !44)
!63 = !DILocation(line: 90, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 49, type: !22, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 51, type: !11)
!66 = !DILocation(line: 51, column: 15, scope: !64)
!67 = !DILocalVariable(name: "dataBuffer", scope: !64, file: !10, line: 52, type: !27)
!68 = !DILocation(line: 52, column: 13, scope: !64)
!69 = !DILocation(line: 53, column: 12, scope: !64)
!70 = !DILocation(line: 53, column: 10, scope: !64)
!71 = !DILocation(line: 55, column: 13, scope: !64)
!72 = !DILocation(line: 55, column: 5, scope: !64)
!73 = !DILocation(line: 56, column: 5, scope: !64)
!74 = !DILocation(line: 56, column: 16, scope: !64)
!75 = !DILocation(line: 57, column: 82, scope: !64)
!76 = !DILocation(line: 57, column: 80, scope: !64)
!77 = !DILocation(line: 58, column: 5, scope: !64)
!78 = !DILocation(line: 59, column: 1, scope: !64)
