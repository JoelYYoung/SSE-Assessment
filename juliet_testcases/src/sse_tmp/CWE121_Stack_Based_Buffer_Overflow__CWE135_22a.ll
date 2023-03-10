; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE135_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G1Global = dso_local global i32 0, align 4, !dbg !9
@CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G2Global = dso_local global i32 0, align 4, !dbg !13
@CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal = dso_local global i32 0, align 4, !dbg !15
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !29
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_badGlobal, align 4, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_badSink(i8* %0), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_badSink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_good() #0 !dbg !34 {
entry:
  call void @goodB2G1(), !dbg !35
  call void @goodB2G2(), !dbg !36
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  store i8* null, i8** %data, align 8, !dbg !62
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !63
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G1Global, align 4, !dbg !64
  %0 = load i8*, i8** %data, align 8, !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G1Sink(i8* %0), !dbg !66
  ret void, !dbg !67
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G1Sink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  store i8* null, i8** %data, align 8, !dbg !71
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !72
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G2Global, align 4, !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G2Sink(i8* %0), !dbg !75
  ret void, !dbg !76
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G2Sink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !81
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal, align 4, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodG2BSink(i8* %0), !dbg !84
  ret void, !dbg !85
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodG2BSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_badGlobal", scope: !2, file: !11, line: 28, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !13, !15}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G1Global", scope: !2, file: !11, line: 47, type: !12, isLocal: false, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_22a.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodB2G2Global", scope: !2, file: !11, line: 48, type: !12, isLocal: false, isDefinition: true)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_goodG2BGlobal", scope: !2, file: !11, line: 49, type: !12, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_bad", scope: !11, file: !11, line: 32, type: !24, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !11, line: 34, type: !6)
!27 = !DILocation(line: 34, column: 12, scope: !23)
!28 = !DILocation(line: 35, column: 10, scope: !23)
!29 = !DILocation(line: 37, column: 10, scope: !23)
!30 = !DILocation(line: 38, column: 61, scope: !23)
!31 = !DILocation(line: 39, column: 59, scope: !23)
!32 = !DILocation(line: 39, column: 5, scope: !23)
!33 = !DILocation(line: 40, column: 1, scope: !23)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_22_good", scope: !11, file: !11, line: 90, type: !24, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DILocation(line: 92, column: 5, scope: !34)
!36 = !DILocation(line: 93, column: 5, scope: !34)
!37 = !DILocation(line: 94, column: 5, scope: !34)
!38 = !DILocation(line: 95, column: 1, scope: !34)
!39 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 106, type: !40, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!12, !12, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !11, line: 106, type: !12)
!46 = !DILocation(line: 106, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !11, line: 106, type: !42)
!48 = !DILocation(line: 106, column: 27, scope: !39)
!49 = !DILocation(line: 109, column: 22, scope: !39)
!50 = !DILocation(line: 109, column: 12, scope: !39)
!51 = !DILocation(line: 109, column: 5, scope: !39)
!52 = !DILocation(line: 111, column: 5, scope: !39)
!53 = !DILocation(line: 112, column: 5, scope: !39)
!54 = !DILocation(line: 113, column: 5, scope: !39)
!55 = !DILocation(line: 116, column: 5, scope: !39)
!56 = !DILocation(line: 117, column: 5, scope: !39)
!57 = !DILocation(line: 118, column: 5, scope: !39)
!58 = !DILocation(line: 120, column: 5, scope: !39)
!59 = distinct !DISubprogram(name: "goodB2G1", scope: !11, file: !11, line: 54, type: !24, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocalVariable(name: "data", scope: !59, file: !11, line: 56, type: !6)
!61 = !DILocation(line: 56, column: 12, scope: !59)
!62 = !DILocation(line: 57, column: 10, scope: !59)
!63 = !DILocation(line: 59, column: 10, scope: !59)
!64 = !DILocation(line: 60, column: 66, scope: !59)
!65 = !DILocation(line: 61, column: 64, scope: !59)
!66 = !DILocation(line: 61, column: 5, scope: !59)
!67 = !DILocation(line: 62, column: 1, scope: !59)
!68 = distinct !DISubprogram(name: "goodB2G2", scope: !11, file: !11, line: 67, type: !24, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !11, line: 69, type: !6)
!70 = !DILocation(line: 69, column: 12, scope: !68)
!71 = !DILocation(line: 70, column: 10, scope: !68)
!72 = !DILocation(line: 72, column: 10, scope: !68)
!73 = !DILocation(line: 73, column: 66, scope: !68)
!74 = !DILocation(line: 74, column: 64, scope: !68)
!75 = !DILocation(line: 74, column: 5, scope: !68)
!76 = !DILocation(line: 75, column: 1, scope: !68)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 80, type: !24, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !11, line: 82, type: !6)
!79 = !DILocation(line: 82, column: 12, scope: !77)
!80 = !DILocation(line: 83, column: 10, scope: !77)
!81 = !DILocation(line: 85, column: 10, scope: !77)
!82 = !DILocation(line: 86, column: 65, scope: !77)
!83 = !DILocation(line: 87, column: 63, scope: !77)
!84 = !DILocation(line: 87, column: 5, scope: !77)
!85 = !DILocation(line: 88, column: 1, scope: !77)
