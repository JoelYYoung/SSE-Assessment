; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  store i32* null, i32** %data, align 8, !dbg !19
  %0 = load i32*, i32** %data, align 8, !dbg !20
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61b_badSource(i32* %0), !dbg !21
  store i32* %call, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !28
  %2 = load i32*, i32** %data, align 8, !dbg !29
  %3 = bitcast i32* %2 to i8*, !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !30
  %4 = bitcast i32* %arraydecay to i8*, !dbg !30
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  %6 = load i32, i32* %arrayidx, align 4, !dbg !31
  call void @printIntLine(i32 %6), !dbg !32
  %7 = load i32*, i32** %data, align 8, !dbg !33
  %8 = bitcast i32* %7 to i8*, !dbg !33
  call void @free(i8* %8) #6, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61_good() #0 !dbg !36 {
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
  %call = call i64 @time(i64* null) #6, !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 %conv) #6, !dbg !51
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61_good(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61_bad(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !60, metadata !DIExpression()), !dbg !61
  store i32* null, i32** %data, align 8, !dbg !62
  %0 = load i32*, i32** %data, align 8, !dbg !63
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61b_goodG2BSource(i32* %0), !dbg !64
  store i32* %call, i32** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !66, metadata !DIExpression()), !dbg !68
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !68
  %2 = load i32*, i32** %data, align 8, !dbg !69
  %3 = bitcast i32* %2 to i8*, !dbg !70
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !70
  %4 = bitcast i32* %arraydecay to i8*, !dbg !70
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !70
  %5 = load i32*, i32** %data, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !71
  %6 = load i32, i32* %arrayidx, align 4, !dbg !71
  call void @printIntLine(i32 %6), !dbg !72
  %7 = load i32*, i32** %data, align 8, !dbg !73
  %8 = bitcast i32* %7 to i8*, !dbg !73
  call void @free(i8* %8) #6, !dbg !74
  ret void, !dbg !75
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61b_goodG2BSource(i32*) #2

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61_bad", scope: !12, file: !12, line: 24, type: !13, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 26, column: 11, scope: !11)
!19 = !DILocation(line: 27, column: 10, scope: !11)
!20 = !DILocation(line: 28, column: 82, scope: !11)
!21 = !DILocation(line: 28, column: 12, scope: !11)
!22 = !DILocation(line: 28, column: 10, scope: !11)
!23 = !DILocalVariable(name: "source", scope: !24, file: !12, line: 30, type: !25)
!24 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 30, column: 13, scope: !24)
!29 = !DILocation(line: 32, column: 17, scope: !24)
!30 = !DILocation(line: 32, column: 9, scope: !24)
!31 = !DILocation(line: 33, column: 22, scope: !24)
!32 = !DILocation(line: 33, column: 9, scope: !24)
!33 = !DILocation(line: 34, column: 14, scope: !24)
!34 = !DILocation(line: 34, column: 9, scope: !24)
!35 = !DILocation(line: 36, column: 1, scope: !11)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memmove_61_good", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 61, column: 5, scope: !36)
!38 = !DILocation(line: 62, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 74, type: !40, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!17, !17, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !12, line: 74, type: !17)
!46 = !DILocation(line: 74, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !12, line: 74, type: !42)
!48 = !DILocation(line: 74, column: 27, scope: !39)
!49 = !DILocation(line: 77, column: 22, scope: !39)
!50 = !DILocation(line: 77, column: 12, scope: !39)
!51 = !DILocation(line: 77, column: 5, scope: !39)
!52 = !DILocation(line: 79, column: 5, scope: !39)
!53 = !DILocation(line: 80, column: 5, scope: !39)
!54 = !DILocation(line: 81, column: 5, scope: !39)
!55 = !DILocation(line: 84, column: 5, scope: !39)
!56 = !DILocation(line: 85, column: 5, scope: !39)
!57 = !DILocation(line: 86, column: 5, scope: !39)
!58 = !DILocation(line: 88, column: 5, scope: !39)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocalVariable(name: "data", scope: !59, file: !12, line: 47, type: !16)
!61 = !DILocation(line: 47, column: 11, scope: !59)
!62 = !DILocation(line: 48, column: 10, scope: !59)
!63 = !DILocation(line: 49, column: 86, scope: !59)
!64 = !DILocation(line: 49, column: 12, scope: !59)
!65 = !DILocation(line: 49, column: 10, scope: !59)
!66 = !DILocalVariable(name: "source", scope: !67, file: !12, line: 51, type: !25)
!67 = distinct !DILexicalBlock(scope: !59, file: !12, line: 50, column: 5)
!68 = !DILocation(line: 51, column: 13, scope: !67)
!69 = !DILocation(line: 53, column: 17, scope: !67)
!70 = !DILocation(line: 53, column: 9, scope: !67)
!71 = !DILocation(line: 54, column: 22, scope: !67)
!72 = !DILocation(line: 54, column: 9, scope: !67)
!73 = !DILocation(line: 55, column: 14, scope: !67)
!74 = !DILocation(line: 55, column: 9, scope: !67)
!75 = !DILocation(line: 57, column: 1, scope: !59)
