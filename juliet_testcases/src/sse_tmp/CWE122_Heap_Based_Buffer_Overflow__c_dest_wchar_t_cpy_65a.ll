; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 200) #4, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  call void %2(i32* %3), !dbg !32
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65b_badSink(i32*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65_good() #0 !dbg !35 {
entry:
  call void @goodG2B(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call i64 @time(i64* null) #4, !dbg !48
  %conv = trunc i64 %call to i32, !dbg !49
  call void @srand(i32 %conv) #4, !dbg !50
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65_good(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65_bad(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !56
  ret i32 0, !dbg !57
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !58 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !61, metadata !DIExpression()), !dbg !62
  store void (i32*)* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !62
  store i32* null, i32** %data, align 8, !dbg !63
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !64
  %0 = bitcast i8* %call to i32*, !dbg !65
  store i32* %0, i32** %data, align 8, !dbg !66
  %1 = load i32*, i32** %data, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !67
  store i32 0, i32* %arrayidx, align 4, !dbg !68
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !69
  %3 = load i32*, i32** %data, align 8, !dbg !70
  call void %2(i32* %3), !dbg !69
  ret void, !dbg !71
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 30, column: 12, scope: !15)
!26 = !DILocation(line: 31, column: 10, scope: !15)
!27 = !DILocation(line: 33, column: 23, scope: !15)
!28 = !DILocation(line: 33, column: 12, scope: !15)
!29 = !DILocation(line: 33, column: 10, scope: !15)
!30 = !DILocation(line: 34, column: 5, scope: !15)
!31 = !DILocation(line: 34, column: 13, scope: !15)
!32 = !DILocation(line: 36, column: 5, scope: !15)
!33 = !DILocation(line: 36, column: 13, scope: !15)
!34 = !DILocation(line: 37, column: 1, scope: !15)
!35 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_65_good", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 59, column: 5, scope: !35)
!37 = !DILocation(line: 60, column: 1, scope: !35)
!38 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 72, type: !39, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!7, !7, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !16, line: 72, type: !7)
!45 = !DILocation(line: 72, column: 14, scope: !38)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !16, line: 72, type: !41)
!47 = !DILocation(line: 72, column: 27, scope: !38)
!48 = !DILocation(line: 75, column: 22, scope: !38)
!49 = !DILocation(line: 75, column: 12, scope: !38)
!50 = !DILocation(line: 75, column: 5, scope: !38)
!51 = !DILocation(line: 77, column: 5, scope: !38)
!52 = !DILocation(line: 78, column: 5, scope: !38)
!53 = !DILocation(line: 79, column: 5, scope: !38)
!54 = !DILocation(line: 82, column: 5, scope: !38)
!55 = !DILocation(line: 83, column: 5, scope: !38)
!56 = !DILocation(line: 84, column: 5, scope: !38)
!57 = !DILocation(line: 86, column: 5, scope: !38)
!58 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 46, type: !17, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", scope: !58, file: !16, line: 48, type: !4)
!60 = !DILocation(line: 48, column: 15, scope: !58)
!61 = !DILocalVariable(name: "funcPtr", scope: !58, file: !16, line: 49, type: !22)
!62 = !DILocation(line: 49, column: 12, scope: !58)
!63 = !DILocation(line: 50, column: 10, scope: !58)
!64 = !DILocation(line: 52, column: 23, scope: !58)
!65 = !DILocation(line: 52, column: 12, scope: !58)
!66 = !DILocation(line: 52, column: 10, scope: !58)
!67 = !DILocation(line: 53, column: 5, scope: !58)
!68 = !DILocation(line: 53, column: 13, scope: !58)
!69 = !DILocation(line: 54, column: 5, scope: !58)
!70 = !DILocation(line: 54, column: 13, scope: !58)
!71 = !DILocation(line: 55, column: 1, scope: !58)
