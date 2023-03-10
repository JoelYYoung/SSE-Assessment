; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i64* null, i64** %data, align 8, !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !24
  %0 = bitcast i8* %call to i64*, !dbg !25
  store i64* %0, i64** %data, align 8, !dbg !26
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63b_badSink(i64** %data), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63b_badSink(i64**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63_good() #0 !dbg !29 {
entry:
  call void @goodG2B(), !dbg !30
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !39, metadata !DIExpression()), !dbg !40
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !41, metadata !DIExpression()), !dbg !42
  %call = call i64 @time(i64* null) #4, !dbg !43
  %conv = trunc i64 %call to i32, !dbg !44
  call void @srand(i32 %conv) #4, !dbg !45
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !46
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63_good(), !dbg !47
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !48
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !49
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63_bad(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !51
  ret i32 0, !dbg !52
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !53 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !54, metadata !DIExpression()), !dbg !55
  store i64* null, i64** %data, align 8, !dbg !56
  %call = call noalias align 16 i8* @malloc(i64 800) #4, !dbg !57
  %0 = bitcast i8* %call to i64*, !dbg !58
  store i64* %0, i64** %data, align 8, !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63b_goodG2BSink(i64** %data), !dbg !60
  ret void, !dbg !61
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63b_goodG2BSink(i64**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63_bad", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63a.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !17)
!23 = !DILocation(line: 27, column: 10, scope: !17)
!24 = !DILocation(line: 29, column: 23, scope: !17)
!25 = !DILocation(line: 29, column: 12, scope: !17)
!26 = !DILocation(line: 29, column: 10, scope: !17)
!27 = !DILocation(line: 30, column: 5, scope: !17)
!28 = !DILocation(line: 31, column: 1, scope: !17)
!29 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_63_good", scope: !18, file: !18, line: 49, type: !19, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 51, column: 5, scope: !29)
!31 = !DILocation(line: 52, column: 1, scope: !29)
!32 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 64, type: !33, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !35, !36}
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !18, line: 64, type: !35)
!40 = !DILocation(line: 64, column: 14, scope: !32)
!41 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !18, line: 64, type: !36)
!42 = !DILocation(line: 64, column: 27, scope: !32)
!43 = !DILocation(line: 67, column: 22, scope: !32)
!44 = !DILocation(line: 67, column: 12, scope: !32)
!45 = !DILocation(line: 67, column: 5, scope: !32)
!46 = !DILocation(line: 69, column: 5, scope: !32)
!47 = !DILocation(line: 70, column: 5, scope: !32)
!48 = !DILocation(line: 71, column: 5, scope: !32)
!49 = !DILocation(line: 74, column: 5, scope: !32)
!50 = !DILocation(line: 75, column: 5, scope: !32)
!51 = !DILocation(line: 76, column: 5, scope: !32)
!52 = !DILocation(line: 78, column: 5, scope: !32)
!53 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 40, type: !19, scopeLine: 41, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "data", scope: !53, file: !18, line: 42, type: !4)
!55 = !DILocation(line: 42, column: 15, scope: !53)
!56 = !DILocation(line: 43, column: 10, scope: !53)
!57 = !DILocation(line: 45, column: 23, scope: !53)
!58 = !DILocation(line: 45, column: 12, scope: !53)
!59 = !DILocation(line: 45, column: 10, scope: !53)
!60 = !DILocation(line: 46, column: 5, scope: !53)
!61 = !DILocation(line: 47, column: 1, scope: !53)
