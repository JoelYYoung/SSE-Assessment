; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 40) #4, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = bitcast i32** %data to i8*, !dbg !25
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64b_badSink(i8* %1), !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64b_badSink(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64_good() #0 !dbg !28 {
entry:
  call void @goodG2B(), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !37, metadata !DIExpression()), !dbg !38
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !39, metadata !DIExpression()), !dbg !40
  %call = call i64 @time(i64* null) #4, !dbg !41
  %conv = trunc i64 %call to i32, !dbg !42
  call void @srand(i32 %conv) #4, !dbg !43
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !44
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64_good(), !dbg !45
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !46
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !47
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64_bad(), !dbg !48
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !49
  ret i32 0, !dbg !50
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !51 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !52, metadata !DIExpression()), !dbg !53
  store i32* null, i32** %data, align 8, !dbg !54
  %call = call noalias align 16 i8* @malloc(i64 44) #4, !dbg !55
  %0 = bitcast i8* %call to i32*, !dbg !56
  store i32* %0, i32** %data, align 8, !dbg !57
  %1 = bitcast i32** %data to i8*, !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64b_goodG2BSink(i8* %1), !dbg !59
  ret void, !dbg !60
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64b_goodG2BSink(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64_bad", scope: !16, file: !16, line: 31, type: !17, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 15, scope: !15)
!21 = !DILocation(line: 34, column: 10, scope: !15)
!22 = !DILocation(line: 36, column: 23, scope: !15)
!23 = !DILocation(line: 36, column: 12, scope: !15)
!24 = !DILocation(line: 36, column: 10, scope: !15)
!25 = !DILocation(line: 37, column: 74, scope: !15)
!26 = !DILocation(line: 37, column: 5, scope: !15)
!27 = !DILocation(line: 38, column: 1, scope: !15)
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_ncpy_64_good", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 58, column: 5, scope: !28)
!30 = !DILocation(line: 59, column: 1, scope: !28)
!31 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 71, type: !32, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!7, !7, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!37 = !DILocalVariable(name: "argc", arg: 1, scope: !31, file: !16, line: 71, type: !7)
!38 = !DILocation(line: 71, column: 14, scope: !31)
!39 = !DILocalVariable(name: "argv", arg: 2, scope: !31, file: !16, line: 71, type: !34)
!40 = !DILocation(line: 71, column: 27, scope: !31)
!41 = !DILocation(line: 74, column: 22, scope: !31)
!42 = !DILocation(line: 74, column: 12, scope: !31)
!43 = !DILocation(line: 74, column: 5, scope: !31)
!44 = !DILocation(line: 76, column: 5, scope: !31)
!45 = !DILocation(line: 77, column: 5, scope: !31)
!46 = !DILocation(line: 78, column: 5, scope: !31)
!47 = !DILocation(line: 81, column: 5, scope: !31)
!48 = !DILocation(line: 82, column: 5, scope: !31)
!49 = !DILocation(line: 83, column: 5, scope: !31)
!50 = !DILocation(line: 85, column: 5, scope: !31)
!51 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "data", scope: !51, file: !16, line: 49, type: !4)
!53 = !DILocation(line: 49, column: 15, scope: !51)
!54 = !DILocation(line: 50, column: 10, scope: !51)
!55 = !DILocation(line: 52, column: 23, scope: !51)
!56 = !DILocation(line: 52, column: 12, scope: !51)
!57 = !DILocation(line: 52, column: 10, scope: !51)
!58 = !DILocation(line: 53, column: 78, scope: !51)
!59 = !DILocation(line: 53, column: 5, scope: !51)
!60 = !DILocation(line: 54, column: 1, scope: !51)
