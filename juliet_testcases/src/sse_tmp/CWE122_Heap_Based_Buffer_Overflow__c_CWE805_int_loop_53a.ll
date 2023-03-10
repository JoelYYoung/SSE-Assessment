; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 200) #4, !dbg !20
  %0 = bitcast i8* %call to i32*, !dbg !21
  store i32* %0, i32** %data, align 8, !dbg !22
  %1 = load i32*, i32** %data, align 8, !dbg !23
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53b_badSink(i32* %1), !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53b_badSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53_good() #0 !dbg !26 {
entry:
  call void @goodG2B(), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !29 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !35, metadata !DIExpression()), !dbg !36
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %call = call i64 @time(i64* null) #4, !dbg !39
  %conv = trunc i64 %call to i32, !dbg !40
  call void @srand(i32 %conv) #4, !dbg !41
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !42
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53_good(), !dbg !43
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !44
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !45
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53_bad(), !dbg !46
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !47
  ret i32 0, !dbg !48
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !49 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !50, metadata !DIExpression()), !dbg !51
  store i32* null, i32** %data, align 8, !dbg !52
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !53
  %0 = bitcast i8* %call to i32*, !dbg !54
  store i32* %0, i32** %data, align 8, !dbg !55
  %1 = load i32*, i32** %data, align 8, !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53b_goodG2BSink(i32* %1), !dbg !57
  ret void, !dbg !58
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53b_goodG2BSink(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53_bad", scope: !14, file: !14, line: 24, type: !15, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!18 = !DILocation(line: 26, column: 11, scope: !13)
!19 = !DILocation(line: 27, column: 10, scope: !13)
!20 = !DILocation(line: 29, column: 19, scope: !13)
!21 = !DILocation(line: 29, column: 12, scope: !13)
!22 = !DILocation(line: 29, column: 10, scope: !13)
!23 = !DILocation(line: 30, column: 70, scope: !13)
!24 = !DILocation(line: 30, column: 5, scope: !13)
!25 = !DILocation(line: 31, column: 1, scope: !13)
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_53_good", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 52, column: 5, scope: !26)
!28 = !DILocation(line: 53, column: 1, scope: !26)
!29 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 65, type: !30, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!5, !5, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!35 = !DILocalVariable(name: "argc", arg: 1, scope: !29, file: !14, line: 65, type: !5)
!36 = !DILocation(line: 65, column: 14, scope: !29)
!37 = !DILocalVariable(name: "argv", arg: 2, scope: !29, file: !14, line: 65, type: !32)
!38 = !DILocation(line: 65, column: 27, scope: !29)
!39 = !DILocation(line: 68, column: 22, scope: !29)
!40 = !DILocation(line: 68, column: 12, scope: !29)
!41 = !DILocation(line: 68, column: 5, scope: !29)
!42 = !DILocation(line: 70, column: 5, scope: !29)
!43 = !DILocation(line: 71, column: 5, scope: !29)
!44 = !DILocation(line: 72, column: 5, scope: !29)
!45 = !DILocation(line: 75, column: 5, scope: !29)
!46 = !DILocation(line: 76, column: 5, scope: !29)
!47 = !DILocation(line: 77, column: 5, scope: !29)
!48 = !DILocation(line: 79, column: 5, scope: !29)
!49 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 41, type: !15, scopeLine: 42, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "data", scope: !49, file: !14, line: 43, type: !4)
!51 = !DILocation(line: 43, column: 11, scope: !49)
!52 = !DILocation(line: 44, column: 10, scope: !49)
!53 = !DILocation(line: 46, column: 19, scope: !49)
!54 = !DILocation(line: 46, column: 12, scope: !49)
!55 = !DILocation(line: 46, column: 10, scope: !49)
!56 = !DILocation(line: 47, column: 74, scope: !49)
!57 = !DILocation(line: 47, column: 5, scope: !49)
!58 = !DILocation(line: 48, column: 1, scope: !49)
