; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_65a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_65_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !18, metadata !DIExpression()), !dbg !22
  store void (i32)* @CWE126_Buffer_Overread__CWE129_large_65b_badSink, void (i32)** %funcPtr, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  store i32 10, i32* %data, align 4, !dbg !24
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !25
  %1 = load i32, i32* %data, align 4, !dbg !26
  call void %0(i32 %1), !dbg !25
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE126_Buffer_Overread__CWE129_large_65b_badSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_65_good() #0 !dbg !28 {
entry:
  call void @goodG2B(), !dbg !29
  call void @goodB2G(), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !32 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !38, metadata !DIExpression()), !dbg !39
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %call = call i64 @time(i64* null) #4, !dbg !42
  %conv = trunc i64 %call to i32, !dbg !43
  call void @srand(i32 %conv) #4, !dbg !44
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !45
  call void @CWE126_Buffer_Overread__CWE129_large_65_good(), !dbg !46
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !47
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !48
  call void @CWE126_Buffer_Overread__CWE129_large_65_bad(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !50
  ret i32 0, !dbg !51
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !52 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !55, metadata !DIExpression()), !dbg !56
  store void (i32)* @CWE126_Buffer_Overread__CWE129_large_65b_goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !56
  store i32 -1, i32* %data, align 4, !dbg !57
  store i32 7, i32* %data, align 4, !dbg !58
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !59
  %1 = load i32, i32* %data, align 4, !dbg !60
  call void %0(i32 %1), !dbg !59
  ret void, !dbg !61
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_large_65b_goodG2BSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !62 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !65, metadata !DIExpression()), !dbg !66
  store void (i32)* @CWE126_Buffer_Overread__CWE129_large_65b_goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !66
  store i32 -1, i32* %data, align 4, !dbg !67
  store i32 10, i32* %data, align 4, !dbg !68
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !69
  %1 = load i32, i32* %data, align 4, !dbg !70
  call void %0(i32 %1), !dbg !69
  ret void, !dbg !71
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_large_65b_goodB2GSink(i32) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_65_bad", scope: !12, file: !12, line: 25, type: !13, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_65a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 27, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 27, column: 9, scope: !11)
!18 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 29, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !16}
!22 = !DILocation(line: 29, column: 12, scope: !11)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocation(line: 33, column: 10, scope: !11)
!25 = !DILocation(line: 35, column: 5, scope: !11)
!26 = !DILocation(line: 35, column: 13, scope: !11)
!27 = !DILocation(line: 36, column: 1, scope: !11)
!28 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_65_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 73, column: 5, scope: !28)
!30 = !DILocation(line: 74, column: 5, scope: !28)
!31 = !DILocation(line: 75, column: 1, scope: !28)
!32 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 86, type: !33, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!16, !16, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !12, line: 86, type: !16)
!39 = !DILocation(line: 86, column: 14, scope: !32)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !12, line: 86, type: !35)
!41 = !DILocation(line: 86, column: 27, scope: !32)
!42 = !DILocation(line: 89, column: 22, scope: !32)
!43 = !DILocation(line: 89, column: 12, scope: !32)
!44 = !DILocation(line: 89, column: 5, scope: !32)
!45 = !DILocation(line: 91, column: 5, scope: !32)
!46 = !DILocation(line: 92, column: 5, scope: !32)
!47 = !DILocation(line: 93, column: 5, scope: !32)
!48 = !DILocation(line: 96, column: 5, scope: !32)
!49 = !DILocation(line: 97, column: 5, scope: !32)
!50 = !DILocation(line: 98, column: 5, scope: !32)
!51 = !DILocation(line: 100, column: 5, scope: !32)
!52 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", scope: !52, file: !12, line: 47, type: !16)
!54 = !DILocation(line: 47, column: 9, scope: !52)
!55 = !DILocalVariable(name: "funcPtr", scope: !52, file: !12, line: 48, type: !19)
!56 = !DILocation(line: 48, column: 12, scope: !52)
!57 = !DILocation(line: 50, column: 10, scope: !52)
!58 = !DILocation(line: 53, column: 10, scope: !52)
!59 = !DILocation(line: 54, column: 5, scope: !52)
!60 = !DILocation(line: 54, column: 13, scope: !52)
!61 = !DILocation(line: 55, column: 1, scope: !52)
!62 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !12, line: 62, type: !16)
!64 = !DILocation(line: 62, column: 9, scope: !62)
!65 = !DILocalVariable(name: "funcPtr", scope: !62, file: !12, line: 63, type: !19)
!66 = !DILocation(line: 63, column: 12, scope: !62)
!67 = !DILocation(line: 65, column: 10, scope: !62)
!68 = !DILocation(line: 67, column: 10, scope: !62)
!69 = !DILocation(line: 68, column: 5, scope: !62)
!70 = !DILocation(line: 68, column: 13, scope: !62)
!71 = !DILocation(line: 69, column: 1, scope: !62)
