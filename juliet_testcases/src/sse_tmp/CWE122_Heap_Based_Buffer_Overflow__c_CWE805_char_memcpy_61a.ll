; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %0 = load i8*, i8** %data, align 8, !dbg !20
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61b_badSource(i8* %0), !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !34
  store i8 0, i8* %arrayidx2, align 1, !dbg !35
  %3 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* %3), !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  call void @free(i8* %4) #6, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61b_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61_good() #0 !dbg !41 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #6, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #6, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  store i8* null, i8** %data, align 8, !dbg !66
  %0 = load i8*, i8** %data, align 8, !dbg !67
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61b_goodG2BSource(i8* %0), !dbg !68
  store i8* %call, i8** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !70, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !73
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %1 = load i8*, i8** %data, align 8, !dbg !76
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !77
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !77
  %2 = load i8*, i8** %data, align 8, !dbg !78
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !78
  store i8 0, i8* %arrayidx2, align 1, !dbg !79
  %3 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* %3), !dbg !81
  %4 = load i8*, i8** %data, align 8, !dbg !82
  call void @free(i8* %4) #6, !dbg !83
  ret void, !dbg !84
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61b_goodG2BSource(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 28, column: 12, scope: !11)
!19 = !DILocation(line: 29, column: 10, scope: !11)
!20 = !DILocation(line: 30, column: 82, scope: !11)
!21 = !DILocation(line: 30, column: 12, scope: !11)
!22 = !DILocation(line: 30, column: 10, scope: !11)
!23 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 32, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 14, scope: !24)
!29 = !DILocation(line: 33, column: 9, scope: !24)
!30 = !DILocation(line: 34, column: 9, scope: !24)
!31 = !DILocation(line: 34, column: 23, scope: !24)
!32 = !DILocation(line: 36, column: 16, scope: !24)
!33 = !DILocation(line: 36, column: 9, scope: !24)
!34 = !DILocation(line: 37, column: 9, scope: !24)
!35 = !DILocation(line: 37, column: 21, scope: !24)
!36 = !DILocation(line: 38, column: 19, scope: !24)
!37 = !DILocation(line: 38, column: 9, scope: !24)
!38 = !DILocation(line: 39, column: 14, scope: !24)
!39 = !DILocation(line: 39, column: 9, scope: !24)
!40 = !DILocation(line: 41, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_61_good", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 69, column: 5, scope: !41)
!43 = !DILocation(line: 70, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !45, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !12, line: 82, type: !47)
!50 = !DILocation(line: 82, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !12, line: 82, type: !48)
!52 = !DILocation(line: 82, column: 27, scope: !44)
!53 = !DILocation(line: 85, column: 22, scope: !44)
!54 = !DILocation(line: 85, column: 12, scope: !44)
!55 = !DILocation(line: 85, column: 5, scope: !44)
!56 = !DILocation(line: 87, column: 5, scope: !44)
!57 = !DILocation(line: 88, column: 5, scope: !44)
!58 = !DILocation(line: 89, column: 5, scope: !44)
!59 = !DILocation(line: 92, column: 5, scope: !44)
!60 = !DILocation(line: 93, column: 5, scope: !44)
!61 = !DILocation(line: 94, column: 5, scope: !44)
!62 = !DILocation(line: 96, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !12, line: 52, type: !16)
!65 = !DILocation(line: 52, column: 12, scope: !63)
!66 = !DILocation(line: 53, column: 10, scope: !63)
!67 = !DILocation(line: 54, column: 86, scope: !63)
!68 = !DILocation(line: 54, column: 12, scope: !63)
!69 = !DILocation(line: 54, column: 10, scope: !63)
!70 = !DILocalVariable(name: "source", scope: !71, file: !12, line: 56, type: !25)
!71 = distinct !DILexicalBlock(scope: !63, file: !12, line: 55, column: 5)
!72 = !DILocation(line: 56, column: 14, scope: !71)
!73 = !DILocation(line: 57, column: 9, scope: !71)
!74 = !DILocation(line: 58, column: 9, scope: !71)
!75 = !DILocation(line: 58, column: 23, scope: !71)
!76 = !DILocation(line: 60, column: 16, scope: !71)
!77 = !DILocation(line: 60, column: 9, scope: !71)
!78 = !DILocation(line: 61, column: 9, scope: !71)
!79 = !DILocation(line: 61, column: 21, scope: !71)
!80 = !DILocation(line: 62, column: 19, scope: !71)
!81 = !DILocation(line: 62, column: 9, scope: !71)
!82 = !DILocation(line: 63, column: 14, scope: !71)
!83 = !DILocation(line: 63, column: 9, scope: !71)
!84 = !DILocation(line: 65, column: 1, scope: !63)
