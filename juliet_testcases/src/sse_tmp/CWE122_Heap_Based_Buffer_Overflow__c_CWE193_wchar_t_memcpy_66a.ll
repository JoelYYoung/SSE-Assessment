; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !21, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 40) #4, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !31
  store i32* %1, i32** %arrayidx, align 16, !dbg !32
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !33
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66b_badSink(i32** %arraydecay), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66b_badSink(i32**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66_good() #0 !dbg !36 {
entry:
  call void @goodG2B(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* null) #4, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #4, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !62, metadata !DIExpression()), !dbg !63
  store i32* null, i32** %data, align 8, !dbg !64
  %call = call noalias align 16 i8* @malloc(i64 44) #4, !dbg !65
  %0 = bitcast i8* %call to i32*, !dbg !66
  store i32* %0, i32** %data, align 8, !dbg !67
  %1 = load i32*, i32** %data, align 8, !dbg !68
  %arrayidx = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !69
  store i32* %1, i32** %arrayidx, align 16, !dbg !70
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66b_goodG2BSink(i32** %arraydecay), !dbg !72
  ret void, !dbg !73
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66b_goodG2BSink(i32**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66_bad", scope: !16, file: !16, line: 31, type: !17, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataArray", scope: !15, file: !16, line: 34, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 5)
!25 = !DILocation(line: 34, column: 15, scope: !15)
!26 = !DILocation(line: 35, column: 10, scope: !15)
!27 = !DILocation(line: 37, column: 23, scope: !15)
!28 = !DILocation(line: 37, column: 12, scope: !15)
!29 = !DILocation(line: 37, column: 10, scope: !15)
!30 = !DILocation(line: 39, column: 20, scope: !15)
!31 = !DILocation(line: 39, column: 5, scope: !15)
!32 = !DILocation(line: 39, column: 18, scope: !15)
!33 = !DILocation(line: 40, column: 76, scope: !15)
!34 = !DILocation(line: 40, column: 5, scope: !15)
!35 = !DILocation(line: 41, column: 1, scope: !15)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_66_good", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 63, column: 5, scope: !36)
!38 = !DILocation(line: 64, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 76, type: !40, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!7, !7, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !16, line: 76, type: !7)
!46 = !DILocation(line: 76, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !16, line: 76, type: !42)
!48 = !DILocation(line: 76, column: 27, scope: !39)
!49 = !DILocation(line: 79, column: 22, scope: !39)
!50 = !DILocation(line: 79, column: 12, scope: !39)
!51 = !DILocation(line: 79, column: 5, scope: !39)
!52 = !DILocation(line: 81, column: 5, scope: !39)
!53 = !DILocation(line: 82, column: 5, scope: !39)
!54 = !DILocation(line: 83, column: 5, scope: !39)
!55 = !DILocation(line: 86, column: 5, scope: !39)
!56 = !DILocation(line: 87, column: 5, scope: !39)
!57 = !DILocation(line: 88, column: 5, scope: !39)
!58 = !DILocation(line: 90, column: 5, scope: !39)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !16, line: 52, type: !4)
!61 = !DILocation(line: 52, column: 15, scope: !59)
!62 = !DILocalVariable(name: "dataArray", scope: !59, file: !16, line: 53, type: !22)
!63 = !DILocation(line: 53, column: 15, scope: !59)
!64 = !DILocation(line: 54, column: 10, scope: !59)
!65 = !DILocation(line: 56, column: 23, scope: !59)
!66 = !DILocation(line: 56, column: 12, scope: !59)
!67 = !DILocation(line: 56, column: 10, scope: !59)
!68 = !DILocation(line: 57, column: 20, scope: !59)
!69 = !DILocation(line: 57, column: 5, scope: !59)
!70 = !DILocation(line: 57, column: 18, scope: !59)
!71 = !DILocation(line: 58, column: 80, scope: !59)
!72 = !DILocation(line: 58, column: 5, scope: !59)
!73 = !DILocation(line: 59, column: 1, scope: !59)
