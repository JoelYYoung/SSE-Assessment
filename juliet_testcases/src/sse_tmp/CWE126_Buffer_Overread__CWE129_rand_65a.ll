; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_65a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_65_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !18, metadata !DIExpression()), !dbg !22
  store void (i32)* @CWE126_Buffer_Overread__CWE129_rand_65b_badSink, void (i32)** %funcPtr, align 8, !dbg !22
  store i32 -1, i32* %data, align 4, !dbg !23
  %call = call i32 @rand() #4, !dbg !24
  %and = and i32 %call, 1, !dbg !24
  %tobool = icmp ne i32 %and, 0, !dbg !24
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !24

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #4, !dbg !24
  %shl = shl i32 %call1, 30, !dbg !24
  %call2 = call i32 @rand() #4, !dbg !24
  %shl3 = shl i32 %call2, 15, !dbg !24
  %xor = xor i32 %shl, %shl3, !dbg !24
  %call4 = call i32 @rand() #4, !dbg !24
  %xor5 = xor i32 %xor, %call4, !dbg !24
  br label %cond.end, !dbg !24

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #4, !dbg !24
  %shl7 = shl i32 %call6, 30, !dbg !24
  %call8 = call i32 @rand() #4, !dbg !24
  %shl9 = shl i32 %call8, 15, !dbg !24
  %xor10 = xor i32 %shl7, %shl9, !dbg !24
  %call11 = call i32 @rand() #4, !dbg !24
  %xor12 = xor i32 %xor10, %call11, !dbg !24
  %sub = sub i32 0, %xor12, !dbg !24
  %sub13 = sub i32 %sub, 1, !dbg !24
  br label %cond.end, !dbg !24

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !24
  store i32 %cond, i32* %data, align 4, !dbg !25
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !26
  %1 = load i32, i32* %data, align 4, !dbg !27
  call void %0(i32 %1), !dbg !26
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE126_Buffer_Overread__CWE129_rand_65b_badSink(i32) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_rand_65_good() #0 !dbg !29 {
entry:
  call void @goodG2B(), !dbg !30
  call void @goodB2G(), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !33 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !39, metadata !DIExpression()), !dbg !40
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !41, metadata !DIExpression()), !dbg !42
  %call = call i64 @time(i64* null) #4, !dbg !43
  %conv = trunc i64 %call to i32, !dbg !44
  call void @srand(i32 %conv) #4, !dbg !45
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !46
  call void @CWE126_Buffer_Overread__CWE129_rand_65_good(), !dbg !47
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !48
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !49
  call void @CWE126_Buffer_Overread__CWE129_rand_65_bad(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !51
  ret i32 0, !dbg !52
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !53 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !56, metadata !DIExpression()), !dbg !57
  store void (i32)* @CWE126_Buffer_Overread__CWE129_rand_65b_goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !57
  store i32 -1, i32* %data, align 4, !dbg !58
  store i32 7, i32* %data, align 4, !dbg !59
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !60
  %1 = load i32, i32* %data, align 4, !dbg !61
  call void %0(i32 %1), !dbg !60
  ret void, !dbg !62
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_rand_65b_goodG2BSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !63 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !66, metadata !DIExpression()), !dbg !67
  store void (i32)* @CWE126_Buffer_Overread__CWE129_rand_65b_goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !67
  store i32 -1, i32* %data, align 4, !dbg !68
  %call = call i32 @rand() #4, !dbg !69
  %and = and i32 %call, 1, !dbg !69
  %tobool = icmp ne i32 %and, 0, !dbg !69
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !69

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #4, !dbg !69
  %shl = shl i32 %call1, 30, !dbg !69
  %call2 = call i32 @rand() #4, !dbg !69
  %shl3 = shl i32 %call2, 15, !dbg !69
  %xor = xor i32 %shl, %shl3, !dbg !69
  %call4 = call i32 @rand() #4, !dbg !69
  %xor5 = xor i32 %xor, %call4, !dbg !69
  br label %cond.end, !dbg !69

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #4, !dbg !69
  %shl7 = shl i32 %call6, 30, !dbg !69
  %call8 = call i32 @rand() #4, !dbg !69
  %shl9 = shl i32 %call8, 15, !dbg !69
  %xor10 = xor i32 %shl7, %shl9, !dbg !69
  %call11 = call i32 @rand() #4, !dbg !69
  %xor12 = xor i32 %xor10, %call11, !dbg !69
  %sub = sub i32 0, %xor12, !dbg !69
  %sub13 = sub i32 %sub, 1, !dbg !69
  br label %cond.end, !dbg !69

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !69
  store i32 %cond, i32* %data, align 4, !dbg !70
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !71
  %1 = load i32, i32* %data, align 4, !dbg !72
  call void %0(i32 %1), !dbg !71
  ret void, !dbg !73
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_rand_65b_goodB2GSink(i32) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_65_bad", scope: !13, file: !13, line: 25, type: !14, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_rand_65a.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 27, type: !4)
!17 = !DILocation(line: 27, column: 9, scope: !12)
!18 = !DILocalVariable(name: "funcPtr", scope: !12, file: !13, line: 29, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !4}
!22 = !DILocation(line: 29, column: 12, scope: !12)
!23 = !DILocation(line: 31, column: 10, scope: !12)
!24 = !DILocation(line: 33, column: 12, scope: !12)
!25 = !DILocation(line: 33, column: 10, scope: !12)
!26 = !DILocation(line: 35, column: 5, scope: !12)
!27 = !DILocation(line: 35, column: 13, scope: !12)
!28 = !DILocation(line: 36, column: 1, scope: !12)
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_rand_65_good", scope: !13, file: !13, line: 71, type: !14, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 73, column: 5, scope: !29)
!31 = !DILocation(line: 74, column: 5, scope: !29)
!32 = !DILocation(line: 75, column: 1, scope: !29)
!33 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 86, type: !34, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{!4, !4, !36}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = !DILocalVariable(name: "argc", arg: 1, scope: !33, file: !13, line: 86, type: !4)
!40 = !DILocation(line: 86, column: 14, scope: !33)
!41 = !DILocalVariable(name: "argv", arg: 2, scope: !33, file: !13, line: 86, type: !36)
!42 = !DILocation(line: 86, column: 27, scope: !33)
!43 = !DILocation(line: 89, column: 22, scope: !33)
!44 = !DILocation(line: 89, column: 12, scope: !33)
!45 = !DILocation(line: 89, column: 5, scope: !33)
!46 = !DILocation(line: 91, column: 5, scope: !33)
!47 = !DILocation(line: 92, column: 5, scope: !33)
!48 = !DILocation(line: 93, column: 5, scope: !33)
!49 = !DILocation(line: 96, column: 5, scope: !33)
!50 = !DILocation(line: 97, column: 5, scope: !33)
!51 = !DILocation(line: 98, column: 5, scope: !33)
!52 = !DILocation(line: 100, column: 5, scope: !33)
!53 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 45, type: !14, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "data", scope: !53, file: !13, line: 47, type: !4)
!55 = !DILocation(line: 47, column: 9, scope: !53)
!56 = !DILocalVariable(name: "funcPtr", scope: !53, file: !13, line: 48, type: !19)
!57 = !DILocation(line: 48, column: 12, scope: !53)
!58 = !DILocation(line: 50, column: 10, scope: !53)
!59 = !DILocation(line: 53, column: 10, scope: !53)
!60 = !DILocation(line: 54, column: 5, scope: !53)
!61 = !DILocation(line: 54, column: 13, scope: !53)
!62 = !DILocation(line: 55, column: 1, scope: !53)
!63 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 60, type: !14, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !13, line: 62, type: !4)
!65 = !DILocation(line: 62, column: 9, scope: !63)
!66 = !DILocalVariable(name: "funcPtr", scope: !63, file: !13, line: 63, type: !19)
!67 = !DILocation(line: 63, column: 12, scope: !63)
!68 = !DILocation(line: 65, column: 10, scope: !63)
!69 = !DILocation(line: 67, column: 12, scope: !63)
!70 = !DILocation(line: 67, column: 10, scope: !63)
!71 = !DILocation(line: 68, column: 5, scope: !63)
!72 = !DILocation(line: 68, column: 13, scope: !63)
!73 = !DILocation(line: 69, column: 1, scope: !63)
