; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66_bad() #0 !dbg !12 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !18, metadata !DIExpression()), !dbg !22
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
  %0 = load i32, i32* %data, align 4, !dbg !26
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !27
  store i32 %0, i32* %arrayidx, align 8, !dbg !28
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !29
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66b_badSink(i32* %arraydecay), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66b_badSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66_good() #0 !dbg !32 {
entry:
  call void @goodG2B(), !dbg !33
  call void @goodB2G(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !36 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66_good(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66_bad(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 -1, i32* %data, align 4, !dbg !61
  store i32 7, i32* %data, align 4, !dbg !62
  %0 = load i32, i32* %data, align 4, !dbg !63
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !64
  store i32 %0, i32* %arrayidx, align 8, !dbg !65
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66b_goodG2BSink(i32* %arraydecay), !dbg !67
  ret void, !dbg !68
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66b_goodG2BSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !69 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 -1, i32* %data, align 4, !dbg !74
  %call = call i32 @rand() #4, !dbg !75
  %and = and i32 %call, 1, !dbg !75
  %tobool = icmp ne i32 %and, 0, !dbg !75
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !75

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #4, !dbg !75
  %shl = shl i32 %call1, 30, !dbg !75
  %call2 = call i32 @rand() #4, !dbg !75
  %shl3 = shl i32 %call2, 15, !dbg !75
  %xor = xor i32 %shl, %shl3, !dbg !75
  %call4 = call i32 @rand() #4, !dbg !75
  %xor5 = xor i32 %xor, %call4, !dbg !75
  br label %cond.end, !dbg !75

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #4, !dbg !75
  %shl7 = shl i32 %call6, 30, !dbg !75
  %call8 = call i32 @rand() #4, !dbg !75
  %shl9 = shl i32 %call8, 15, !dbg !75
  %xor10 = xor i32 %shl7, %shl9, !dbg !75
  %call11 = call i32 @rand() #4, !dbg !75
  %xor12 = xor i32 %xor10, %call11, !dbg !75
  %sub = sub i32 0, %xor12, !dbg !75
  %sub13 = sub i32 %sub, 1, !dbg !75
  br label %cond.end, !dbg !75

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !75
  store i32 %cond, i32* %data, align 4, !dbg !76
  %0 = load i32, i32* %data, align 4, !dbg !77
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !78
  store i32 %0, i32* %arrayidx, align 8, !dbg !79
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66b_goodB2GSink(i32* %arraydecay), !dbg !81
  ret void, !dbg !82
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66b_goodB2GSink(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!12 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66_bad", scope: !13, file: !13, line: 25, type: !14, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66a.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 27, type: !4)
!17 = !DILocation(line: 27, column: 9, scope: !12)
!18 = !DILocalVariable(name: "dataArray", scope: !12, file: !13, line: 28, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 5)
!22 = !DILocation(line: 28, column: 9, scope: !12)
!23 = !DILocation(line: 30, column: 10, scope: !12)
!24 = !DILocation(line: 32, column: 12, scope: !12)
!25 = !DILocation(line: 32, column: 10, scope: !12)
!26 = !DILocation(line: 34, column: 20, scope: !12)
!27 = !DILocation(line: 34, column: 5, scope: !12)
!28 = !DILocation(line: 34, column: 18, scope: !12)
!29 = !DILocation(line: 35, column: 65, scope: !12)
!30 = !DILocation(line: 35, column: 5, scope: !12)
!31 = !DILocation(line: 36, column: 1, scope: !12)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_rand_66_good", scope: !13, file: !13, line: 73, type: !14, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 75, column: 5, scope: !32)
!34 = !DILocation(line: 76, column: 5, scope: !32)
!35 = !DILocation(line: 77, column: 1, scope: !32)
!36 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 88, type: !37, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!4, !4, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !13, line: 88, type: !4)
!43 = !DILocation(line: 88, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !13, line: 88, type: !39)
!45 = !DILocation(line: 88, column: 27, scope: !36)
!46 = !DILocation(line: 91, column: 22, scope: !36)
!47 = !DILocation(line: 91, column: 12, scope: !36)
!48 = !DILocation(line: 91, column: 5, scope: !36)
!49 = !DILocation(line: 93, column: 5, scope: !36)
!50 = !DILocation(line: 94, column: 5, scope: !36)
!51 = !DILocation(line: 95, column: 5, scope: !36)
!52 = !DILocation(line: 98, column: 5, scope: !36)
!53 = !DILocation(line: 99, column: 5, scope: !36)
!54 = !DILocation(line: 100, column: 5, scope: !36)
!55 = !DILocation(line: 102, column: 5, scope: !36)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 45, type: !14, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", scope: !56, file: !13, line: 47, type: !4)
!58 = !DILocation(line: 47, column: 9, scope: !56)
!59 = !DILocalVariable(name: "dataArray", scope: !56, file: !13, line: 48, type: !19)
!60 = !DILocation(line: 48, column: 9, scope: !56)
!61 = !DILocation(line: 50, column: 10, scope: !56)
!62 = !DILocation(line: 53, column: 10, scope: !56)
!63 = !DILocation(line: 54, column: 20, scope: !56)
!64 = !DILocation(line: 54, column: 5, scope: !56)
!65 = !DILocation(line: 54, column: 18, scope: !56)
!66 = !DILocation(line: 55, column: 69, scope: !56)
!67 = !DILocation(line: 55, column: 5, scope: !56)
!68 = !DILocation(line: 56, column: 1, scope: !56)
!69 = distinct !DISubprogram(name: "goodB2G", scope: !13, file: !13, line: 61, type: !14, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !13, line: 63, type: !4)
!71 = !DILocation(line: 63, column: 9, scope: !69)
!72 = !DILocalVariable(name: "dataArray", scope: !69, file: !13, line: 64, type: !19)
!73 = !DILocation(line: 64, column: 9, scope: !69)
!74 = !DILocation(line: 66, column: 10, scope: !69)
!75 = !DILocation(line: 68, column: 12, scope: !69)
!76 = !DILocation(line: 68, column: 10, scope: !69)
!77 = !DILocation(line: 69, column: 20, scope: !69)
!78 = !DILocation(line: 69, column: 5, scope: !69)
!79 = !DILocation(line: 69, column: 18, scope: !69)
!80 = !DILocation(line: 70, column: 69, scope: !69)
!81 = !DILocation(line: 70, column: 5, scope: !69)
!82 = !DILocation(line: 71, column: 1, scope: !69)
