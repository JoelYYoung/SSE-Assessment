; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_68a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE135_68_badData = dso_local global i8* null, align 8, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodG2BData = dso_local global i8* null, align 8, !dbg !9
@CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodB2GData = dso_local global i8* null, align 8, !dbg !12
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  store i8* %0, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_badData, align 8, !dbg !28
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_badSink(), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_badSink(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_good() #0 !dbg !31 {
entry:
  call void @goodG2B(), !dbg !32
  call void @goodB2G(), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i64 @time(i64* null) #4, !dbg !46
  %conv = trunc i64 %call to i32, !dbg !47
  call void @srand(i32 %conv) #4, !dbg !48
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_good(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_bad(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !57, metadata !DIExpression()), !dbg !58
  store i8* null, i8** %data, align 8, !dbg !59
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !60
  %0 = load i8*, i8** %data, align 8, !dbg !61
  store i8* %0, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodG2BData, align 8, !dbg !62
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_goodG2BSink(), !dbg !63
  ret void, !dbg !64
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_goodG2BSink(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i8* null, i8** %data, align 8, !dbg !68
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !69
  %0 = load i8*, i8** %data, align 8, !dbg !70
  store i8* %0, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodB2GData, align 8, !dbg !71
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_goodB2GSink(), !dbg !72
  ret void, !dbg !73
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_68b_goodB2GSink(...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_68_badData", scope: !2, file: !11, line: 25, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !12}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodG2BData", scope: !2, file: !11, line: 26, type: !6, isLocal: false, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_68a.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_68_goodB2GData", scope: !2, file: !11, line: 27, type: !6, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_68_bad", scope: !11, file: !11, line: 34, type: !21, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !11, line: 36, type: !6)
!24 = !DILocation(line: 36, column: 12, scope: !20)
!25 = !DILocation(line: 37, column: 10, scope: !20)
!26 = !DILocation(line: 39, column: 10, scope: !20)
!27 = !DILocation(line: 40, column: 61, scope: !20)
!28 = !DILocation(line: 40, column: 59, scope: !20)
!29 = !DILocation(line: 41, column: 5, scope: !20)
!30 = !DILocation(line: 42, column: 1, scope: !20)
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_68_good", scope: !11, file: !11, line: 74, type: !21, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DILocation(line: 76, column: 5, scope: !31)
!33 = !DILocation(line: 77, column: 5, scope: !31)
!34 = !DILocation(line: 78, column: 1, scope: !31)
!35 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 89, type: !36, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !38, !39}
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !11, line: 89, type: !38)
!43 = !DILocation(line: 89, column: 14, scope: !35)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !11, line: 89, type: !39)
!45 = !DILocation(line: 89, column: 27, scope: !35)
!46 = !DILocation(line: 92, column: 22, scope: !35)
!47 = !DILocation(line: 92, column: 12, scope: !35)
!48 = !DILocation(line: 92, column: 5, scope: !35)
!49 = !DILocation(line: 94, column: 5, scope: !35)
!50 = !DILocation(line: 95, column: 5, scope: !35)
!51 = !DILocation(line: 96, column: 5, scope: !35)
!52 = !DILocation(line: 99, column: 5, scope: !35)
!53 = !DILocation(line: 100, column: 5, scope: !35)
!54 = !DILocation(line: 101, column: 5, scope: !35)
!55 = !DILocation(line: 103, column: 5, scope: !35)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 53, type: !21, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocalVariable(name: "data", scope: !56, file: !11, line: 55, type: !6)
!58 = !DILocation(line: 55, column: 12, scope: !56)
!59 = !DILocation(line: 56, column: 10, scope: !56)
!60 = !DILocation(line: 58, column: 10, scope: !56)
!61 = !DILocation(line: 59, column: 65, scope: !56)
!62 = !DILocation(line: 59, column: 63, scope: !56)
!63 = !DILocation(line: 60, column: 5, scope: !56)
!64 = !DILocation(line: 61, column: 1, scope: !56)
!65 = distinct !DISubprogram(name: "goodB2G", scope: !11, file: !11, line: 64, type: !21, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "data", scope: !65, file: !11, line: 66, type: !6)
!67 = !DILocation(line: 66, column: 12, scope: !65)
!68 = !DILocation(line: 67, column: 10, scope: !65)
!69 = !DILocation(line: 69, column: 10, scope: !65)
!70 = !DILocation(line: 70, column: 65, scope: !65)
!71 = !DILocation(line: 70, column: 63, scope: !65)
!72 = !DILocation(line: 71, column: 5, scope: !65)
!73 = !DILocation(line: 72, column: 1, scope: !65)
