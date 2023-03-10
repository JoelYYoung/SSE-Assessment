; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  store i64* null, i64** %data, align 8, !dbg !23
  %0 = load i64*, i64** %data, align 8, !dbg !24
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61b_badSource(i64* %0), !dbg !25
  store i64* %call, i64** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !27, metadata !DIExpression()), !dbg !32
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !32
  %2 = load i64*, i64** %data, align 8, !dbg !33
  %3 = bitcast i64* %2 to i8*, !dbg !34
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !34
  %4 = bitcast i64* %arraydecay to i8*, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !34
  %5 = load i64*, i64** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !35
  %6 = load i64, i64* %arrayidx, align 8, !dbg !35
  call void @printLongLongLine(i64 %6), !dbg !36
  %7 = load i64*, i64** %data, align 8, !dbg !37
  %8 = bitcast i64* %7 to i8*, !dbg !37
  call void @free(i8* %8) #6, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61b_badSource(i64*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #6, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #6, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i64* null, i64** %data, align 8, !dbg !67
  %0 = load i64*, i64** %data, align 8, !dbg !68
  %call = call i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61b_goodG2BSource(i64* %0), !dbg !69
  store i64* %call, i64** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !71, metadata !DIExpression()), !dbg !73
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !73
  %2 = load i64*, i64** %data, align 8, !dbg !74
  %3 = bitcast i64* %2 to i8*, !dbg !75
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !75
  %4 = bitcast i64* %arraydecay to i8*, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !75
  %5 = load i64*, i64** %data, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !76
  %6 = load i64, i64* %arrayidx, align 8, !dbg !76
  call void @printLongLongLine(i64 %6), !dbg !77
  %7 = load i64*, i64** %data, align 8, !dbg !78
  %8 = bitcast i64* %7 to i8*, !dbg !78
  call void @free(i8* %8) #6, !dbg !79
  ret void, !dbg !80
}

declare dso_local i64* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61b_goodG2BSource(i64*) #2

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61_bad", scope: !12, file: !12, line: 24, type: !13, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 26, column: 15, scope: !11)
!23 = !DILocation(line: 27, column: 10, scope: !11)
!24 = !DILocation(line: 28, column: 85, scope: !11)
!25 = !DILocation(line: 28, column: 12, scope: !11)
!26 = !DILocation(line: 28, column: 10, scope: !11)
!27 = !DILocalVariable(name: "source", scope: !28, file: !12, line: 30, type: !29)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 30, column: 17, scope: !28)
!33 = !DILocation(line: 32, column: 16, scope: !28)
!34 = !DILocation(line: 32, column: 9, scope: !28)
!35 = !DILocation(line: 33, column: 27, scope: !28)
!36 = !DILocation(line: 33, column: 9, scope: !28)
!37 = !DILocation(line: 34, column: 14, scope: !28)
!38 = !DILocation(line: 34, column: 9, scope: !28)
!39 = !DILocation(line: 36, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_61_good", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 61, column: 5, scope: !40)
!42 = !DILocation(line: 62, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 74, type: !44, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 74, type: !46)
!51 = !DILocation(line: 74, column: 14, scope: !43)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 74, type: !47)
!53 = !DILocation(line: 74, column: 27, scope: !43)
!54 = !DILocation(line: 77, column: 22, scope: !43)
!55 = !DILocation(line: 77, column: 12, scope: !43)
!56 = !DILocation(line: 77, column: 5, scope: !43)
!57 = !DILocation(line: 79, column: 5, scope: !43)
!58 = !DILocation(line: 80, column: 5, scope: !43)
!59 = !DILocation(line: 81, column: 5, scope: !43)
!60 = !DILocation(line: 84, column: 5, scope: !43)
!61 = !DILocation(line: 85, column: 5, scope: !43)
!62 = !DILocation(line: 86, column: 5, scope: !43)
!63 = !DILocation(line: 88, column: 5, scope: !43)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocalVariable(name: "data", scope: !64, file: !12, line: 47, type: !16)
!66 = !DILocation(line: 47, column: 15, scope: !64)
!67 = !DILocation(line: 48, column: 10, scope: !64)
!68 = !DILocation(line: 49, column: 89, scope: !64)
!69 = !DILocation(line: 49, column: 12, scope: !64)
!70 = !DILocation(line: 49, column: 10, scope: !64)
!71 = !DILocalVariable(name: "source", scope: !72, file: !12, line: 51, type: !29)
!72 = distinct !DILexicalBlock(scope: !64, file: !12, line: 50, column: 5)
!73 = !DILocation(line: 51, column: 17, scope: !72)
!74 = !DILocation(line: 53, column: 16, scope: !72)
!75 = !DILocation(line: 53, column: 9, scope: !72)
!76 = !DILocation(line: 54, column: 27, scope: !72)
!77 = !DILocation(line: 54, column: 9, scope: !72)
!78 = !DILocation(line: 55, column: 14, scope: !72)
!79 = !DILocation(line: 55, column: 9, scope: !72)
!80 = !DILocation(line: 57, column: 1, scope: !64)
