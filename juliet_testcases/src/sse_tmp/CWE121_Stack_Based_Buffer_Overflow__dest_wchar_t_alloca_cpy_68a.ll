; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_badData = dso_local global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_goodG2BData = dso_local global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_badData, align 8, !dbg !39
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68b_badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68b_badSink(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = alloca i8, i64 200, align 16, !dbg !70
  %1 = bitcast i8* %0 to i32*, !dbg !71
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %2 = alloca i8, i64 400, align 16, !dbg !74
  %3 = bitcast i8* %2 to i32*, !dbg !75
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !73
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !76
  store i32* %4, i32** %data, align 8, !dbg !77
  %5 = load i32*, i32** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %6 = load i32*, i32** %data, align 8, !dbg !80
  store i32* %6, i32** @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_goodG2BData, align 8, !dbg !81
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68b_goodG2BSink(), !dbg !82
  ret void, !dbg !83
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_bad", scope: !14, file: !14, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 31, type: !6)
!25 = !DILocation(line: 31, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 32, type: !6)
!27 = !DILocation(line: 32, column: 15, scope: !21)
!28 = !DILocation(line: 32, column: 42, scope: !21)
!29 = !DILocation(line: 32, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 33, type: !6)
!31 = !DILocation(line: 33, column: 15, scope: !21)
!32 = !DILocation(line: 33, column: 43, scope: !21)
!33 = !DILocation(line: 33, column: 32, scope: !21)
!34 = !DILocation(line: 36, column: 12, scope: !21)
!35 = !DILocation(line: 36, column: 10, scope: !21)
!36 = !DILocation(line: 37, column: 5, scope: !21)
!37 = !DILocation(line: 37, column: 13, scope: !21)
!38 = !DILocation(line: 38, column: 78, scope: !21)
!39 = !DILocation(line: 38, column: 76, scope: !21)
!40 = !DILocation(line: 39, column: 5, scope: !21)
!41 = !DILocation(line: 40, column: 1, scope: !21)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_68_good", scope: !14, file: !14, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 64, column: 5, scope: !42)
!44 = !DILocation(line: 65, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 77, type: !46, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!9, !9, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !14, line: 77, type: !9)
!52 = !DILocation(line: 77, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !14, line: 77, type: !48)
!54 = !DILocation(line: 77, column: 27, scope: !45)
!55 = !DILocation(line: 80, column: 22, scope: !45)
!56 = !DILocation(line: 80, column: 12, scope: !45)
!57 = !DILocation(line: 80, column: 5, scope: !45)
!58 = !DILocation(line: 82, column: 5, scope: !45)
!59 = !DILocation(line: 83, column: 5, scope: !45)
!60 = !DILocation(line: 84, column: 5, scope: !45)
!61 = !DILocation(line: 87, column: 5, scope: !45)
!62 = !DILocation(line: 88, column: 5, scope: !45)
!63 = !DILocation(line: 89, column: 5, scope: !45)
!64 = !DILocation(line: 91, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 50, type: !22, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "data", scope: !65, file: !14, line: 52, type: !6)
!67 = !DILocation(line: 52, column: 15, scope: !65)
!68 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !14, line: 53, type: !6)
!69 = !DILocation(line: 53, column: 15, scope: !65)
!70 = !DILocation(line: 53, column: 42, scope: !65)
!71 = !DILocation(line: 53, column: 31, scope: !65)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !14, line: 54, type: !6)
!73 = !DILocation(line: 54, column: 15, scope: !65)
!74 = !DILocation(line: 54, column: 43, scope: !65)
!75 = !DILocation(line: 54, column: 32, scope: !65)
!76 = !DILocation(line: 56, column: 12, scope: !65)
!77 = !DILocation(line: 56, column: 10, scope: !65)
!78 = !DILocation(line: 57, column: 5, scope: !65)
!79 = !DILocation(line: 57, column: 13, scope: !65)
!80 = !DILocation(line: 58, column: 82, scope: !65)
!81 = !DILocation(line: 58, column: 80, scope: !65)
!82 = !DILocation(line: 59, column: 5, scope: !65)
!83 = !DILocation(line: 60, column: 1, scope: !65)
