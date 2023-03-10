; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %data, align 8, !dbg !23
  %1 = load i32*, i32** %data, align 8, !dbg !24
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61b_badSource(i32* %1), !dbg !25
  store i32* %call1, i32** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !27, metadata !DIExpression()), !dbg !32
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !33
  %3 = bitcast i32* %arraydecay to i8*, !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %5 = bitcast i32* %4 to i8*, !dbg !33
  %6 = load i32*, i32** %data, align 8, !dbg !35
  %call2 = call i64 @wcslen(i32* %6) #8, !dbg !36
  %mul = mul i64 %call2, 4, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 4 %5, i64 %mul, i1 false), !dbg !33
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %7 = load i32*, i32** %data, align 8, !dbg !40
  call void @printWLine(i32* %7), !dbg !41
  %8 = load i32*, i32** %data, align 8, !dbg !42
  %9 = bitcast i32* %8 to i8*, !dbg !42
  call void @free(i8* %9) #7, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61b_badSource(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #7, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #7, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !71
  %0 = bitcast i8* %call to i32*, !dbg !72
  store i32* %0, i32** %data, align 8, !dbg !73
  %1 = load i32*, i32** %data, align 8, !dbg !74
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61b_goodG2BSource(i32* %1), !dbg !75
  store i32* %call1, i32** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !77, metadata !DIExpression()), !dbg !79
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !79
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !80
  %3 = bitcast i32* %arraydecay to i8*, !dbg !80
  %4 = load i32*, i32** %data, align 8, !dbg !81
  %5 = bitcast i32* %4 to i8*, !dbg !80
  %6 = load i32*, i32** %data, align 8, !dbg !82
  %call2 = call i64 @wcslen(i32* %6) #8, !dbg !83
  %mul = mul i64 %call2, 4, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 4 %5, i64 %mul, i1 false), !dbg !80
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %7 = load i32*, i32** %data, align 8, !dbg !87
  call void @printWLine(i32* %7), !dbg !88
  %8 = load i32*, i32** %data, align 8, !dbg !89
  %9 = bitcast i32* %8 to i8*, !dbg !89
  call void @free(i8* %9) #7, !dbg !90
  ret void, !dbg !91
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61b_goodG2BSource(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61_bad", scope: !16, file: !16, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 15, scope: !15)
!21 = !DILocation(line: 29, column: 23, scope: !15)
!22 = !DILocation(line: 29, column: 12, scope: !15)
!23 = !DILocation(line: 29, column: 10, scope: !15)
!24 = !DILocation(line: 30, column: 85, scope: !15)
!25 = !DILocation(line: 30, column: 12, scope: !15)
!26 = !DILocation(line: 30, column: 10, scope: !15)
!27 = !DILocalVariable(name: "dest", scope: !28, file: !16, line: 32, type: !29)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 32, column: 17, scope: !28)
!33 = !DILocation(line: 34, column: 9, scope: !28)
!34 = !DILocation(line: 34, column: 22, scope: !28)
!35 = !DILocation(line: 34, column: 35, scope: !28)
!36 = !DILocation(line: 34, column: 28, scope: !28)
!37 = !DILocation(line: 34, column: 40, scope: !28)
!38 = !DILocation(line: 35, column: 9, scope: !28)
!39 = !DILocation(line: 35, column: 20, scope: !28)
!40 = !DILocation(line: 36, column: 20, scope: !28)
!41 = !DILocation(line: 36, column: 9, scope: !28)
!42 = !DILocation(line: 37, column: 14, scope: !28)
!43 = !DILocation(line: 37, column: 9, scope: !28)
!44 = !DILocation(line: 39, column: 1, scope: !15)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_61_good", scope: !16, file: !16, line: 63, type: !17, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 65, column: 5, scope: !45)
!47 = !DILocation(line: 66, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 78, type: !49, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!7, !7, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !16, line: 78, type: !7)
!55 = !DILocation(line: 78, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !16, line: 78, type: !51)
!57 = !DILocation(line: 78, column: 27, scope: !48)
!58 = !DILocation(line: 81, column: 22, scope: !48)
!59 = !DILocation(line: 81, column: 12, scope: !48)
!60 = !DILocation(line: 81, column: 5, scope: !48)
!61 = !DILocation(line: 83, column: 5, scope: !48)
!62 = !DILocation(line: 84, column: 5, scope: !48)
!63 = !DILocation(line: 85, column: 5, scope: !48)
!64 = !DILocation(line: 88, column: 5, scope: !48)
!65 = !DILocation(line: 89, column: 5, scope: !48)
!66 = !DILocation(line: 90, column: 5, scope: !48)
!67 = !DILocation(line: 92, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !16, line: 50, type: !4)
!70 = !DILocation(line: 50, column: 15, scope: !68)
!71 = !DILocation(line: 51, column: 23, scope: !68)
!72 = !DILocation(line: 51, column: 12, scope: !68)
!73 = !DILocation(line: 51, column: 10, scope: !68)
!74 = !DILocation(line: 52, column: 89, scope: !68)
!75 = !DILocation(line: 52, column: 12, scope: !68)
!76 = !DILocation(line: 52, column: 10, scope: !68)
!77 = !DILocalVariable(name: "dest", scope: !78, file: !16, line: 54, type: !29)
!78 = distinct !DILexicalBlock(scope: !68, file: !16, line: 53, column: 5)
!79 = !DILocation(line: 54, column: 17, scope: !78)
!80 = !DILocation(line: 56, column: 9, scope: !78)
!81 = !DILocation(line: 56, column: 22, scope: !78)
!82 = !DILocation(line: 56, column: 35, scope: !78)
!83 = !DILocation(line: 56, column: 28, scope: !78)
!84 = !DILocation(line: 56, column: 40, scope: !78)
!85 = !DILocation(line: 57, column: 9, scope: !78)
!86 = !DILocation(line: 57, column: 20, scope: !78)
!87 = !DILocation(line: 58, column: 20, scope: !78)
!88 = !DILocation(line: 58, column: 9, scope: !78)
!89 = !DILocation(line: 59, column: 14, scope: !78)
!90 = !DILocation(line: 59, column: 9, scope: !78)
!91 = !DILocation(line: 61, column: 1, scope: !68)
