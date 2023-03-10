; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_68a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__CWE129_large_68_badData = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__CWE129_large_68_goodG2BData = dso_local global i32 0, align 4, !dbg !8
@CWE126_Buffer_Overread__CWE129_large_68_goodB2GData = dso_local global i32 0, align 4, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_68_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  store i32 10, i32* %data, align 4, !dbg !26
  %0 = load i32, i32* %data, align 4, !dbg !27
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_large_68_badData, align 4, !dbg !28
  call void (...) @CWE126_Buffer_Overread__CWE129_large_68b_badSink(), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE126_Buffer_Overread__CWE129_large_68b_badSink(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_68_good() #0 !dbg !31 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* null) #4, !dbg !45
  %conv = trunc i64 %call to i32, !dbg !46
  call void @srand(i32 %conv) #4, !dbg !47
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @CWE126_Buffer_Overread__CWE129_large_68_good(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !51
  call void @CWE126_Buffer_Overread__CWE129_large_68_bad(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !55 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 -1, i32* %data, align 4, !dbg !58
  store i32 7, i32* %data, align 4, !dbg !59
  %0 = load i32, i32* %data, align 4, !dbg !60
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_large_68_goodG2BData, align 4, !dbg !61
  call void (...) @CWE126_Buffer_Overread__CWE129_large_68b_goodG2BSink(), !dbg !62
  ret void, !dbg !63
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_large_68b_goodG2BSink(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !64 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 -1, i32* %data, align 4, !dbg !67
  store i32 10, i32* %data, align 4, !dbg !68
  %0 = load i32, i32* %data, align 4, !dbg !69
  store i32 %0, i32* @CWE126_Buffer_Overread__CWE129_large_68_goodB2GData, align 4, !dbg !70
  call void (...) @CWE126_Buffer_Overread__CWE129_large_68b_goodB2GSink(), !dbg !71
  ret void, !dbg !72
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_large_68b_goodB2GSink(...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_large_68_badData", scope: !2, file: !10, line: 20, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_large_68_goodG2BData", scope: !2, file: !10, line: 21, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_68a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__CWE129_large_68_goodB2GData", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_68_bad", scope: !10, file: !10, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 31, type: !11)
!24 = !DILocation(line: 31, column: 9, scope: !20)
!25 = !DILocation(line: 33, column: 10, scope: !20)
!26 = !DILocation(line: 35, column: 10, scope: !20)
!27 = !DILocation(line: 36, column: 55, scope: !20)
!28 = !DILocation(line: 36, column: 53, scope: !20)
!29 = !DILocation(line: 37, column: 5, scope: !20)
!30 = !DILocation(line: 38, column: 1, scope: !20)
!31 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_68_good", scope: !10, file: !10, line: 73, type: !21, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DILocation(line: 75, column: 5, scope: !31)
!33 = !DILocation(line: 76, column: 5, scope: !31)
!34 = !DILocation(line: 77, column: 1, scope: !31)
!35 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 88, type: !36, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{!11, !11, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !10, line: 88, type: !11)
!42 = !DILocation(line: 88, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !10, line: 88, type: !38)
!44 = !DILocation(line: 88, column: 27, scope: !35)
!45 = !DILocation(line: 91, column: 22, scope: !35)
!46 = !DILocation(line: 91, column: 12, scope: !35)
!47 = !DILocation(line: 91, column: 5, scope: !35)
!48 = !DILocation(line: 93, column: 5, scope: !35)
!49 = !DILocation(line: 94, column: 5, scope: !35)
!50 = !DILocation(line: 95, column: 5, scope: !35)
!51 = !DILocation(line: 98, column: 5, scope: !35)
!52 = !DILocation(line: 99, column: 5, scope: !35)
!53 = !DILocation(line: 100, column: 5, scope: !35)
!54 = !DILocation(line: 102, column: 5, scope: !35)
!55 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 49, type: !21, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocalVariable(name: "data", scope: !55, file: !10, line: 51, type: !11)
!57 = !DILocation(line: 51, column: 9, scope: !55)
!58 = !DILocation(line: 53, column: 10, scope: !55)
!59 = !DILocation(line: 56, column: 10, scope: !55)
!60 = !DILocation(line: 57, column: 59, scope: !55)
!61 = !DILocation(line: 57, column: 57, scope: !55)
!62 = !DILocation(line: 58, column: 5, scope: !55)
!63 = !DILocation(line: 59, column: 1, scope: !55)
!64 = distinct !DISubprogram(name: "goodB2G", scope: !10, file: !10, line: 62, type: !21, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !10, line: 64, type: !11)
!66 = !DILocation(line: 64, column: 9, scope: !64)
!67 = !DILocation(line: 66, column: 10, scope: !64)
!68 = !DILocation(line: 68, column: 10, scope: !64)
!69 = !DILocation(line: 69, column: 59, scope: !64)
!70 = !DILocation(line: 69, column: 57, scope: !64)
!71 = !DILocation(line: 70, column: 5, scope: !64)
!72 = !DILocation(line: 71, column: 1, scope: !64)
