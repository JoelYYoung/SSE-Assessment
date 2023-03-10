; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i32*)* @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !34
  %6 = load i32*, i32** %data, align 8, !dbg !35
  call void %5(i32* %6), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65b_badSink(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65_good() #0 !dbg !37 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !63, metadata !DIExpression()), !dbg !64
  store void (i32*)* @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = alloca i8, i64 200, align 16, !dbg !67
  %1 = bitcast i8* %0 to i32*, !dbg !68
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %2 = alloca i8, i64 400, align 16, !dbg !71
  %3 = bitcast i8* %2 to i32*, !dbg !72
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !70
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !73
  store i32* %4, i32** %data, align 8, !dbg !74
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !75
  %6 = load i32*, i32** %data, align 8, !dbg !76
  call void %5(i32* %6), !dbg !75
  ret void, !dbg !77
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65_bad", scope: !14, file: !14, line: 24, type: !15, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!18 = !DILocation(line: 26, column: 11, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 28, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 28, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 29, type: !4)
!25 = !DILocation(line: 29, column: 11, scope: !13)
!26 = !DILocation(line: 29, column: 34, scope: !13)
!27 = !DILocation(line: 29, column: 27, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 30, type: !4)
!29 = !DILocation(line: 30, column: 11, scope: !13)
!30 = !DILocation(line: 30, column: 35, scope: !13)
!31 = !DILocation(line: 30, column: 28, scope: !13)
!32 = !DILocation(line: 33, column: 12, scope: !13)
!33 = !DILocation(line: 33, column: 10, scope: !13)
!34 = !DILocation(line: 35, column: 5, scope: !13)
!35 = !DILocation(line: 35, column: 13, scope: !13)
!36 = !DILocation(line: 36, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_65_good", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocation(line: 58, column: 5, scope: !37)
!39 = !DILocation(line: 59, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 71, type: !41, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{!5, !5, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !14, line: 71, type: !5)
!47 = !DILocation(line: 71, column: 14, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !14, line: 71, type: !43)
!49 = !DILocation(line: 71, column: 27, scope: !40)
!50 = !DILocation(line: 74, column: 22, scope: !40)
!51 = !DILocation(line: 74, column: 12, scope: !40)
!52 = !DILocation(line: 74, column: 5, scope: !40)
!53 = !DILocation(line: 76, column: 5, scope: !40)
!54 = !DILocation(line: 77, column: 5, scope: !40)
!55 = !DILocation(line: 78, column: 5, scope: !40)
!56 = !DILocation(line: 81, column: 5, scope: !40)
!57 = !DILocation(line: 82, column: 5, scope: !40)
!58 = !DILocation(line: 83, column: 5, scope: !40)
!59 = !DILocation(line: 85, column: 5, scope: !40)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 45, type: !15, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !60, file: !14, line: 47, type: !4)
!62 = !DILocation(line: 47, column: 11, scope: !60)
!63 = !DILocalVariable(name: "funcPtr", scope: !60, file: !14, line: 48, type: !20)
!64 = !DILocation(line: 48, column: 12, scope: !60)
!65 = !DILocalVariable(name: "dataBadBuffer", scope: !60, file: !14, line: 49, type: !4)
!66 = !DILocation(line: 49, column: 11, scope: !60)
!67 = !DILocation(line: 49, column: 34, scope: !60)
!68 = !DILocation(line: 49, column: 27, scope: !60)
!69 = !DILocalVariable(name: "dataGoodBuffer", scope: !60, file: !14, line: 50, type: !4)
!70 = !DILocation(line: 50, column: 11, scope: !60)
!71 = !DILocation(line: 50, column: 35, scope: !60)
!72 = !DILocation(line: 50, column: 28, scope: !60)
!73 = !DILocation(line: 52, column: 12, scope: !60)
!74 = !DILocation(line: 52, column: 10, scope: !60)
!75 = !DILocation(line: 53, column: 5, scope: !60)
!76 = !DILocation(line: 53, column: 13, scope: !60)
!77 = !DILocation(line: 54, column: 1, scope: !60)
