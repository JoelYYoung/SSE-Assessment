; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !19
  store i8* %call, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61b_badSource(i8* %0), !dbg !22
  store i8* %call1, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %2) #5, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  call void @printLine(i8* %3), !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  call void @free(i8* %4) #5, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61b_badSource(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #5, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #5, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !63
  store i8* %call, i8** %data, align 8, !dbg !64
  %0 = load i8*, i8** %data, align 8, !dbg !65
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61b_goodG2BSource(i8* %0), !dbg !66
  store i8* %call1, i8** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !68, metadata !DIExpression()), !dbg !70
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !70
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !71
  %2 = load i8*, i8** %data, align 8, !dbg !72
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %2) #5, !dbg !73
  %3 = load i8*, i8** %data, align 8, !dbg !74
  call void @printLine(i8* %3), !dbg !75
  %4 = load i8*, i8** %data, align 8, !dbg !76
  call void @free(i8* %4) #5, !dbg !77
  ret void, !dbg !78
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61b_goodG2BSource(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocation(line: 29, column: 20, scope: !13)
!20 = !DILocation(line: 29, column: 10, scope: !13)
!21 = !DILocation(line: 30, column: 76, scope: !13)
!22 = !DILocation(line: 30, column: 12, scope: !13)
!23 = !DILocation(line: 30, column: 10, scope: !13)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !14, line: 32, type: !26)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 32, column: 14, scope: !25)
!30 = !DILocation(line: 34, column: 16, scope: !25)
!31 = !DILocation(line: 34, column: 22, scope: !25)
!32 = !DILocation(line: 34, column: 9, scope: !25)
!33 = !DILocation(line: 35, column: 19, scope: !25)
!34 = !DILocation(line: 35, column: 9, scope: !25)
!35 = !DILocation(line: 36, column: 14, scope: !25)
!36 = !DILocation(line: 36, column: 9, scope: !25)
!37 = !DILocation(line: 38, column: 1, scope: !13)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_61_good", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 63, column: 5, scope: !38)
!40 = !DILocation(line: 64, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 76, type: !42, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !14, line: 76, type: !44)
!47 = !DILocation(line: 76, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !14, line: 76, type: !45)
!49 = !DILocation(line: 76, column: 27, scope: !41)
!50 = !DILocation(line: 79, column: 22, scope: !41)
!51 = !DILocation(line: 79, column: 12, scope: !41)
!52 = !DILocation(line: 79, column: 5, scope: !41)
!53 = !DILocation(line: 81, column: 5, scope: !41)
!54 = !DILocation(line: 82, column: 5, scope: !41)
!55 = !DILocation(line: 83, column: 5, scope: !41)
!56 = !DILocation(line: 86, column: 5, scope: !41)
!57 = !DILocation(line: 87, column: 5, scope: !41)
!58 = !DILocation(line: 88, column: 5, scope: !41)
!59 = !DILocation(line: 90, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !60, file: !14, line: 49, type: !4)
!62 = !DILocation(line: 49, column: 12, scope: !60)
!63 = !DILocation(line: 50, column: 20, scope: !60)
!64 = !DILocation(line: 50, column: 10, scope: !60)
!65 = !DILocation(line: 51, column: 80, scope: !60)
!66 = !DILocation(line: 51, column: 12, scope: !60)
!67 = !DILocation(line: 51, column: 10, scope: !60)
!68 = !DILocalVariable(name: "dest", scope: !69, file: !14, line: 53, type: !26)
!69 = distinct !DILexicalBlock(scope: !60, file: !14, line: 52, column: 5)
!70 = !DILocation(line: 53, column: 14, scope: !69)
!71 = !DILocation(line: 55, column: 16, scope: !69)
!72 = !DILocation(line: 55, column: 22, scope: !69)
!73 = !DILocation(line: 55, column: 9, scope: !69)
!74 = !DILocation(line: 56, column: 19, scope: !69)
!75 = !DILocation(line: 56, column: 9, scope: !69)
!76 = !DILocation(line: 57, column: 14, scope: !69)
!77 = !DILocation(line: 57, column: 9, scope: !69)
!78 = !DILocation(line: 59, column: 1, scope: !60)
