; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %data, align 8, !dbg !23
  %1 = load i32*, i32** %data, align 8, !dbg !24
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61b_badSource(i32* %1), !dbg !25
  store i32* %call1, i32** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !27, metadata !DIExpression()), !dbg !32
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %3) #5, !dbg !35
  %4 = load i32*, i32** %data, align 8, !dbg !36
  call void @printWLine(i32* %4), !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %6 = bitcast i32* %5 to i8*, !dbg !38
  call void @free(i8* %6) #5, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61b_badSource(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #5, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #5, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !67
  %0 = bitcast i8* %call to i32*, !dbg !68
  store i32* %0, i32** %data, align 8, !dbg !69
  %1 = load i32*, i32** %data, align 8, !dbg !70
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61b_goodG2BSource(i32* %1), !dbg !71
  store i32* %call1, i32** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !73, metadata !DIExpression()), !dbg !75
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !75
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !76
  %3 = load i32*, i32** %data, align 8, !dbg !77
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %3) #5, !dbg !78
  %4 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* %4), !dbg !80
  %5 = load i32*, i32** %data, align 8, !dbg !81
  %6 = bitcast i32* %5 to i8*, !dbg !81
  call void @free(i8* %6) #5, !dbg !82
  ret void, !dbg !83
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61b_goodG2BSource(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocation(line: 29, column: 23, scope: !15)
!22 = !DILocation(line: 29, column: 12, scope: !15)
!23 = !DILocation(line: 29, column: 10, scope: !15)
!24 = !DILocation(line: 30, column: 79, scope: !15)
!25 = !DILocation(line: 30, column: 12, scope: !15)
!26 = !DILocation(line: 30, column: 10, scope: !15)
!27 = !DILocalVariable(name: "dest", scope: !28, file: !16, line: 32, type: !29)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 32, column: 17, scope: !28)
!33 = !DILocation(line: 34, column: 16, scope: !28)
!34 = !DILocation(line: 34, column: 22, scope: !28)
!35 = !DILocation(line: 34, column: 9, scope: !28)
!36 = !DILocation(line: 35, column: 20, scope: !28)
!37 = !DILocation(line: 35, column: 9, scope: !28)
!38 = !DILocation(line: 36, column: 14, scope: !28)
!39 = !DILocation(line: 36, column: 9, scope: !28)
!40 = !DILocation(line: 38, column: 1, scope: !15)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_61_good", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 63, column: 5, scope: !41)
!43 = !DILocation(line: 64, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 76, type: !45, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!7, !7, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !16, line: 76, type: !7)
!51 = !DILocation(line: 76, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !16, line: 76, type: !47)
!53 = !DILocation(line: 76, column: 27, scope: !44)
!54 = !DILocation(line: 79, column: 22, scope: !44)
!55 = !DILocation(line: 79, column: 12, scope: !44)
!56 = !DILocation(line: 79, column: 5, scope: !44)
!57 = !DILocation(line: 81, column: 5, scope: !44)
!58 = !DILocation(line: 82, column: 5, scope: !44)
!59 = !DILocation(line: 83, column: 5, scope: !44)
!60 = !DILocation(line: 86, column: 5, scope: !44)
!61 = !DILocation(line: 87, column: 5, scope: !44)
!62 = !DILocation(line: 88, column: 5, scope: !44)
!63 = !DILocation(line: 90, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !16, line: 49, type: !4)
!66 = !DILocation(line: 49, column: 15, scope: !64)
!67 = !DILocation(line: 50, column: 23, scope: !64)
!68 = !DILocation(line: 50, column: 12, scope: !64)
!69 = !DILocation(line: 50, column: 10, scope: !64)
!70 = !DILocation(line: 51, column: 83, scope: !64)
!71 = !DILocation(line: 51, column: 12, scope: !64)
!72 = !DILocation(line: 51, column: 10, scope: !64)
!73 = !DILocalVariable(name: "dest", scope: !74, file: !16, line: 53, type: !29)
!74 = distinct !DILexicalBlock(scope: !64, file: !16, line: 52, column: 5)
!75 = !DILocation(line: 53, column: 17, scope: !74)
!76 = !DILocation(line: 55, column: 16, scope: !74)
!77 = !DILocation(line: 55, column: 22, scope: !74)
!78 = !DILocation(line: 55, column: 9, scope: !74)
!79 = !DILocation(line: 56, column: 20, scope: !74)
!80 = !DILocation(line: 56, column: 9, scope: !74)
!81 = !DILocation(line: 57, column: 14, scope: !74)
!82 = !DILocation(line: 57, column: 9, scope: !74)
!83 = !DILocation(line: 59, column: 1, scope: !64)
