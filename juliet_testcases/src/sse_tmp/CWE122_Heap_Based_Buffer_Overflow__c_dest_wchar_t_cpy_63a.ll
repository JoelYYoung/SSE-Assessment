; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 200) #4, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !25
  store i32 0, i32* %arrayidx, align 4, !dbg !26
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63b_badSink(i32** %data), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63b_badSink(i32**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63_good() #0 !dbg !29 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !38, metadata !DIExpression()), !dbg !39
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %call = call i64 @time(i64* null) #4, !dbg !42
  %conv = trunc i64 %call to i32, !dbg !43
  call void @srand(i32 %conv) #4, !dbg !44
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !45
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63_good(), !dbg !46
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !47
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !48
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63_bad(), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !50
  ret i32 0, !dbg !51
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !52 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !53, metadata !DIExpression()), !dbg !54
  store i32* null, i32** %data, align 8, !dbg !55
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !56
  %0 = bitcast i8* %call to i32*, !dbg !57
  store i32* %0, i32** %data, align 8, !dbg !58
  %1 = load i32*, i32** %data, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !59
  store i32 0, i32* %arrayidx, align 4, !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63b_goodG2BSink(i32** %data), !dbg !61
  ret void, !dbg !62
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63b_goodG2BSink(i32**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocation(line: 29, column: 10, scope: !15)
!22 = !DILocation(line: 31, column: 23, scope: !15)
!23 = !DILocation(line: 31, column: 12, scope: !15)
!24 = !DILocation(line: 31, column: 10, scope: !15)
!25 = !DILocation(line: 32, column: 5, scope: !15)
!26 = !DILocation(line: 32, column: 13, scope: !15)
!27 = !DILocation(line: 33, column: 5, scope: !15)
!28 = !DILocation(line: 34, column: 1, scope: !15)
!29 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_63_good", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 55, column: 5, scope: !29)
!31 = !DILocation(line: 56, column: 1, scope: !29)
!32 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 68, type: !33, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!7, !7, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !16, line: 68, type: !7)
!39 = !DILocation(line: 68, column: 14, scope: !32)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !16, line: 68, type: !35)
!41 = !DILocation(line: 68, column: 27, scope: !32)
!42 = !DILocation(line: 71, column: 22, scope: !32)
!43 = !DILocation(line: 71, column: 12, scope: !32)
!44 = !DILocation(line: 71, column: 5, scope: !32)
!45 = !DILocation(line: 73, column: 5, scope: !32)
!46 = !DILocation(line: 74, column: 5, scope: !32)
!47 = !DILocation(line: 75, column: 5, scope: !32)
!48 = !DILocation(line: 78, column: 5, scope: !32)
!49 = !DILocation(line: 79, column: 5, scope: !32)
!50 = !DILocation(line: 80, column: 5, scope: !32)
!51 = !DILocation(line: 82, column: 5, scope: !32)
!52 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 43, type: !17, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", scope: !52, file: !16, line: 45, type: !4)
!54 = !DILocation(line: 45, column: 15, scope: !52)
!55 = !DILocation(line: 46, column: 10, scope: !52)
!56 = !DILocation(line: 48, column: 23, scope: !52)
!57 = !DILocation(line: 48, column: 12, scope: !52)
!58 = !DILocation(line: 48, column: 10, scope: !52)
!59 = !DILocation(line: 49, column: 5, scope: !52)
!60 = !DILocation(line: 49, column: 13, scope: !52)
!61 = !DILocation(line: 50, column: 5, scope: !52)
!62 = !DILocation(line: 51, column: 1, scope: !52)
