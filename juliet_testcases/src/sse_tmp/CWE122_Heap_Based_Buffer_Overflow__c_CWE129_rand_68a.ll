; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_badData = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_goodG2BData = dso_local global i32 0, align 4, !dbg !9
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_goodB2GData = dso_local global i32 0, align 4, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_bad() #0 !dbg !20 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %call = call i32 @rand() #4, !dbg !26
  %and = and i32 %call, 1, !dbg !26
  %tobool = icmp ne i32 %and, 0, !dbg !26
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !26

cond.true:                                        ; preds = %entry
  %call1 = call i32 @rand() #4, !dbg !26
  %shl = shl i32 %call1, 30, !dbg !26
  %call2 = call i32 @rand() #4, !dbg !26
  %shl3 = shl i32 %call2, 15, !dbg !26
  %xor = xor i32 %shl, %shl3, !dbg !26
  %call4 = call i32 @rand() #4, !dbg !26
  %xor5 = xor i32 %xor, %call4, !dbg !26
  br label %cond.end, !dbg !26

cond.false:                                       ; preds = %entry
  %call6 = call i32 @rand() #4, !dbg !26
  %shl7 = shl i32 %call6, 30, !dbg !26
  %call8 = call i32 @rand() #4, !dbg !26
  %shl9 = shl i32 %call8, 15, !dbg !26
  %xor10 = xor i32 %shl7, %shl9, !dbg !26
  %call11 = call i32 @rand() #4, !dbg !26
  %xor12 = xor i32 %xor10, %call11, !dbg !26
  %sub = sub i32 0, %xor12, !dbg !26
  %sub13 = sub i32 %sub, 1, !dbg !26
  br label %cond.end, !dbg !26

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %xor5, %cond.true ], [ %sub13, %cond.false ], !dbg !26
  store i32 %cond, i32* %data, align 4, !dbg !27
  %0 = load i32, i32* %data, align 4, !dbg !28
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_badData, align 4, !dbg !29
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68b_badSink(), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_good() #0 !dbg !32 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_good(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_bad(), !dbg !53
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
  call void @llvm.dbg.declare(metadata i32* %data, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 -1, i32* %data, align 4, !dbg !59
  store i32 7, i32* %data, align 4, !dbg !60
  %0 = load i32, i32* %data, align 4, !dbg !61
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_goodG2BData, align 4, !dbg !62
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68b_goodG2BSink(), !dbg !63
  ret void, !dbg !64
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68b_goodG2BSink(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !66, metadata !DIExpression()), !dbg !67
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
  %0 = load i32, i32* %data, align 4, !dbg !71
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_goodB2GData, align 4, !dbg !72
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68b_goodB2GSink(), !dbg !73
  ret void, !dbg !74
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68b_goodB2GSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_badData", scope: !2, file: !11, line: 20, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9, !12}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_goodG2BData", scope: !2, file: !11, line: 21, type: !6, isLocal: false, isDefinition: true)
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68a.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_goodB2GData", scope: !2, file: !11, line: 22, type: !6, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_bad", scope: !11, file: !11, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !11, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 9, scope: !20)
!25 = !DILocation(line: 33, column: 10, scope: !20)
!26 = !DILocation(line: 35, column: 12, scope: !20)
!27 = !DILocation(line: 35, column: 10, scope: !20)
!28 = !DILocation(line: 36, column: 67, scope: !20)
!29 = !DILocation(line: 36, column: 65, scope: !20)
!30 = !DILocation(line: 37, column: 5, scope: !20)
!31 = !DILocation(line: 38, column: 1, scope: !20)
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_rand_68_good", scope: !11, file: !11, line: 73, type: !21, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DILocation(line: 75, column: 5, scope: !32)
!34 = !DILocation(line: 76, column: 5, scope: !32)
!35 = !DILocation(line: 77, column: 1, scope: !32)
!36 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 88, type: !37, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!37 = !DISubroutineType(types: !38)
!38 = !{!6, !6, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !11, line: 88, type: !6)
!43 = !DILocation(line: 88, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !11, line: 88, type: !39)
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
!56 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 49, type: !21, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocalVariable(name: "data", scope: !56, file: !11, line: 51, type: !6)
!58 = !DILocation(line: 51, column: 9, scope: !56)
!59 = !DILocation(line: 53, column: 10, scope: !56)
!60 = !DILocation(line: 56, column: 10, scope: !56)
!61 = !DILocation(line: 57, column: 71, scope: !56)
!62 = !DILocation(line: 57, column: 69, scope: !56)
!63 = !DILocation(line: 58, column: 5, scope: !56)
!64 = !DILocation(line: 59, column: 1, scope: !56)
!65 = distinct !DISubprogram(name: "goodB2G", scope: !11, file: !11, line: 62, type: !21, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "data", scope: !65, file: !11, line: 64, type: !6)
!67 = !DILocation(line: 64, column: 9, scope: !65)
!68 = !DILocation(line: 66, column: 10, scope: !65)
!69 = !DILocation(line: 68, column: 12, scope: !65)
!70 = !DILocation(line: 68, column: 10, scope: !65)
!71 = !DILocation(line: 69, column: 71, scope: !65)
!72 = !DILocation(line: 69, column: 69, scope: !65)
!73 = !DILocation(line: 70, column: 5, scope: !65)
!74 = !DILocation(line: 71, column: 1, scope: !65)
