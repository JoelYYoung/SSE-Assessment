; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %0 = load i32*, i32** %data, align 8, !dbg !22
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61b_badSource(i32* %0), !dbg !23
  store i32* %call, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !25, metadata !DIExpression()), !dbg !30
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !30
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61_bad.source to i8*), i64 44, i1 false), !dbg !30
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %3 = bitcast i32* %2 to i8*, !dbg !32
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !32
  %4 = bitcast i32* %arraydecay to i8*, !dbg !32
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !33
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !34
  %add = add i64 %call2, 1, !dbg !35
  %mul = mul i64 %add, 4, !dbg !36
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !37
  call void @printWLine(i32* %5), !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %7 = bitcast i32* %6 to i8*, !dbg !39
  call void @free(i8* %7) #7, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61b_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #7, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #7, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i32* null, i32** %data, align 8, !dbg !68
  %0 = load i32*, i32** %data, align 8, !dbg !69
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61b_goodG2BSource(i32* %0), !dbg !70
  store i32* %call, i32** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !72, metadata !DIExpression()), !dbg !74
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !74
  %2 = load i32*, i32** %data, align 8, !dbg !75
  %3 = bitcast i32* %2 to i8*, !dbg !76
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !76
  %4 = bitcast i32* %arraydecay to i8*, !dbg !76
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !77
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !78
  %add = add i64 %call2, 1, !dbg !79
  %mul = mul i64 %add, 4, !dbg !80
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 %mul, i1 false), !dbg !76
  %5 = load i32*, i32** %data, align 8, !dbg !81
  call void @printWLine(i32* %5), !dbg !82
  %6 = load i32*, i32** %data, align 8, !dbg !83
  %7 = bitcast i32* %6 to i8*, !dbg !83
  call void @free(i8* %7) #7, !dbg !84
  ret void, !dbg !85
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 33, column: 15, scope: !11)
!21 = !DILocation(line: 34, column: 10, scope: !11)
!22 = !DILocation(line: 35, column: 86, scope: !11)
!23 = !DILocation(line: 35, column: 12, scope: !11)
!24 = !DILocation(line: 35, column: 10, scope: !11)
!25 = !DILocalVariable(name: "source", scope: !26, file: !12, line: 37, type: !27)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 37, column: 17, scope: !26)
!31 = !DILocation(line: 40, column: 17, scope: !26)
!32 = !DILocation(line: 40, column: 9, scope: !26)
!33 = !DILocation(line: 40, column: 39, scope: !26)
!34 = !DILocation(line: 40, column: 32, scope: !26)
!35 = !DILocation(line: 40, column: 47, scope: !26)
!36 = !DILocation(line: 40, column: 52, scope: !26)
!37 = !DILocation(line: 41, column: 20, scope: !26)
!38 = !DILocation(line: 41, column: 9, scope: !26)
!39 = !DILocation(line: 42, column: 14, scope: !26)
!40 = !DILocation(line: 42, column: 9, scope: !26)
!41 = !DILocation(line: 44, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_61_good", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 70, column: 5, scope: !42)
!44 = !DILocation(line: 71, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !46, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!19, !19, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 83, type: !19)
!52 = !DILocation(line: 83, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 83, type: !48)
!54 = !DILocation(line: 83, column: 27, scope: !45)
!55 = !DILocation(line: 86, column: 22, scope: !45)
!56 = !DILocation(line: 86, column: 12, scope: !45)
!57 = !DILocation(line: 86, column: 5, scope: !45)
!58 = !DILocation(line: 88, column: 5, scope: !45)
!59 = !DILocation(line: 89, column: 5, scope: !45)
!60 = !DILocation(line: 90, column: 5, scope: !45)
!61 = !DILocation(line: 93, column: 5, scope: !45)
!62 = !DILocation(line: 94, column: 5, scope: !45)
!63 = !DILocation(line: 95, column: 5, scope: !45)
!64 = !DILocation(line: 97, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 55, type: !16)
!67 = !DILocation(line: 55, column: 15, scope: !65)
!68 = !DILocation(line: 56, column: 10, scope: !65)
!69 = !DILocation(line: 57, column: 90, scope: !65)
!70 = !DILocation(line: 57, column: 12, scope: !65)
!71 = !DILocation(line: 57, column: 10, scope: !65)
!72 = !DILocalVariable(name: "source", scope: !73, file: !12, line: 59, type: !27)
!73 = distinct !DILexicalBlock(scope: !65, file: !12, line: 58, column: 5)
!74 = !DILocation(line: 59, column: 17, scope: !73)
!75 = !DILocation(line: 62, column: 17, scope: !73)
!76 = !DILocation(line: 62, column: 9, scope: !73)
!77 = !DILocation(line: 62, column: 39, scope: !73)
!78 = !DILocation(line: 62, column: 32, scope: !73)
!79 = !DILocation(line: 62, column: 47, scope: !73)
!80 = !DILocation(line: 62, column: 52, scope: !73)
!81 = !DILocation(line: 63, column: 20, scope: !73)
!82 = !DILocation(line: 63, column: 9, scope: !73)
!83 = !DILocation(line: 64, column: 14, scope: !73)
!84 = !DILocation(line: 64, column: 9, scope: !73)
!85 = !DILocation(line: 66, column: 1, scope: !65)
