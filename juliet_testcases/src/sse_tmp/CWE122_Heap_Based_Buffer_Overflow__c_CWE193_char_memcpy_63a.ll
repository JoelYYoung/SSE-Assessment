; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 10) #4, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63b_badSink(i8** %data), !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63b_badSink(i8**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63_good() #0 !dbg !24 {
entry:
  call void @goodG2B(), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !34, metadata !DIExpression()), !dbg !35
  %call = call i64 @time(i64* null) #4, !dbg !36
  %conv = trunc i64 %call to i32, !dbg !37
  call void @srand(i32 %conv) #4, !dbg !38
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !39
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63_good(), !dbg !40
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !41
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !42
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63_bad(), !dbg !43
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !44
  ret i32 0, !dbg !45
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !46 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !47, metadata !DIExpression()), !dbg !48
  store i8* null, i8** %data, align 8, !dbg !49
  %call = call noalias align 16 i8* @malloc(i64 11) #4, !dbg !50
  store i8* %call, i8** %data, align 8, !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63b_goodG2BSink(i8** %data), !dbg !52
  ret void, !dbg !53
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63b_goodG2BSink(i8**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !4)
!18 = !DILocation(line: 33, column: 12, scope: !13)
!19 = !DILocation(line: 34, column: 10, scope: !13)
!20 = !DILocation(line: 36, column: 20, scope: !13)
!21 = !DILocation(line: 36, column: 10, scope: !13)
!22 = !DILocation(line: 37, column: 5, scope: !13)
!23 = !DILocation(line: 38, column: 1, scope: !13)
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_63_good", scope: !14, file: !14, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 58, column: 5, scope: !24)
!26 = !DILocation(line: 59, column: 1, scope: !24)
!27 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 71, type: !28, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!30, !30, !31}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!32 = !DILocalVariable(name: "argc", arg: 1, scope: !27, file: !14, line: 71, type: !30)
!33 = !DILocation(line: 71, column: 14, scope: !27)
!34 = !DILocalVariable(name: "argv", arg: 2, scope: !27, file: !14, line: 71, type: !31)
!35 = !DILocation(line: 71, column: 27, scope: !27)
!36 = !DILocation(line: 74, column: 22, scope: !27)
!37 = !DILocation(line: 74, column: 12, scope: !27)
!38 = !DILocation(line: 74, column: 5, scope: !27)
!39 = !DILocation(line: 76, column: 5, scope: !27)
!40 = !DILocation(line: 77, column: 5, scope: !27)
!41 = !DILocation(line: 78, column: 5, scope: !27)
!42 = !DILocation(line: 81, column: 5, scope: !27)
!43 = !DILocation(line: 82, column: 5, scope: !27)
!44 = !DILocation(line: 83, column: 5, scope: !27)
!45 = !DILocation(line: 85, column: 5, scope: !27)
!46 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "data", scope: !46, file: !14, line: 49, type: !4)
!48 = !DILocation(line: 49, column: 12, scope: !46)
!49 = !DILocation(line: 50, column: 10, scope: !46)
!50 = !DILocation(line: 52, column: 20, scope: !46)
!51 = !DILocation(line: 52, column: 10, scope: !46)
!52 = !DILocation(line: 53, column: 5, scope: !46)
!53 = !DILocation(line: 54, column: 1, scope: !46)
