; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %0 = load i32*, i32** %data, align 8, !dbg !22
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61b_badSource(i32* %0), !dbg !23
  store i32* %call, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !25, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !31
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %2 = bitcast i32* %1 to i8*, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !36
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !36
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !36
  %4 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  call void @printWLine(i32* %5), !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %7 = bitcast i32* %6 to i8*, !dbg !41
  call void @free(i8* %7) #5, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61b_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i32* null, i32** %data, align 8, !dbg !70
  %0 = load i32*, i32** %data, align 8, !dbg !71
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61b_goodG2BSource(i32* %0), !dbg !72
  store i32* %call, i32** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !74, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !77
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !78
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  %1 = load i32*, i32** %data, align 8, !dbg !81
  %2 = bitcast i32* %1 to i8*, !dbg !82
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !82
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !82
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !82
  %4 = load i32*, i32** %data, align 8, !dbg !83
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !83
  store i32 0, i32* %arrayidx3, align 4, !dbg !84
  %5 = load i32*, i32** %data, align 8, !dbg !85
  call void @printWLine(i32* %5), !dbg !86
  %6 = load i32*, i32** %data, align 8, !dbg !87
  %7 = bitcast i32* %6 to i8*, !dbg !87
  call void @free(i8* %7) #5, !dbg !88
  ret void, !dbg !89
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !11)
!21 = !DILocation(line: 29, column: 10, scope: !11)
!22 = !DILocation(line: 30, column: 86, scope: !11)
!23 = !DILocation(line: 30, column: 12, scope: !11)
!24 = !DILocation(line: 30, column: 10, scope: !11)
!25 = !DILocalVariable(name: "source", scope: !26, file: !12, line: 32, type: !27)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 32, column: 17, scope: !26)
!31 = !DILocation(line: 33, column: 17, scope: !26)
!32 = !DILocation(line: 33, column: 9, scope: !26)
!33 = !DILocation(line: 34, column: 9, scope: !26)
!34 = !DILocation(line: 34, column: 23, scope: !26)
!35 = !DILocation(line: 36, column: 17, scope: !26)
!36 = !DILocation(line: 36, column: 9, scope: !26)
!37 = !DILocation(line: 37, column: 9, scope: !26)
!38 = !DILocation(line: 37, column: 21, scope: !26)
!39 = !DILocation(line: 38, column: 20, scope: !26)
!40 = !DILocation(line: 38, column: 9, scope: !26)
!41 = !DILocation(line: 39, column: 14, scope: !26)
!42 = !DILocation(line: 39, column: 9, scope: !26)
!43 = !DILocation(line: 41, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_61_good", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 69, column: 5, scope: !44)
!46 = !DILocation(line: 70, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !48, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!19, !19, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !12, line: 82, type: !19)
!54 = !DILocation(line: 82, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !12, line: 82, type: !50)
!56 = !DILocation(line: 82, column: 27, scope: !47)
!57 = !DILocation(line: 85, column: 22, scope: !47)
!58 = !DILocation(line: 85, column: 12, scope: !47)
!59 = !DILocation(line: 85, column: 5, scope: !47)
!60 = !DILocation(line: 87, column: 5, scope: !47)
!61 = !DILocation(line: 88, column: 5, scope: !47)
!62 = !DILocation(line: 89, column: 5, scope: !47)
!63 = !DILocation(line: 92, column: 5, scope: !47)
!64 = !DILocation(line: 93, column: 5, scope: !47)
!65 = !DILocation(line: 94, column: 5, scope: !47)
!66 = !DILocation(line: 96, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !12, line: 52, type: !16)
!69 = !DILocation(line: 52, column: 15, scope: !67)
!70 = !DILocation(line: 53, column: 10, scope: !67)
!71 = !DILocation(line: 54, column: 90, scope: !67)
!72 = !DILocation(line: 54, column: 12, scope: !67)
!73 = !DILocation(line: 54, column: 10, scope: !67)
!74 = !DILocalVariable(name: "source", scope: !75, file: !12, line: 56, type: !27)
!75 = distinct !DILexicalBlock(scope: !67, file: !12, line: 55, column: 5)
!76 = !DILocation(line: 56, column: 17, scope: !75)
!77 = !DILocation(line: 57, column: 17, scope: !75)
!78 = !DILocation(line: 57, column: 9, scope: !75)
!79 = !DILocation(line: 58, column: 9, scope: !75)
!80 = !DILocation(line: 58, column: 23, scope: !75)
!81 = !DILocation(line: 60, column: 17, scope: !75)
!82 = !DILocation(line: 60, column: 9, scope: !75)
!83 = !DILocation(line: 61, column: 9, scope: !75)
!84 = !DILocation(line: 61, column: 21, scope: !75)
!85 = !DILocation(line: 62, column: 20, scope: !75)
!86 = !DILocation(line: 62, column: 9, scope: !75)
!87 = !DILocation(line: 63, column: 14, scope: !75)
!88 = !DILocation(line: 63, column: 9, scope: !75)
!89 = !DILocation(line: 65, column: 1, scope: !67)
