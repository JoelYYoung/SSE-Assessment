; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68_badData = external dso_local global %struct._twoIntsStruct*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68_goodG2BData = external dso_local global %struct._twoIntsStruct*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !13, metadata !DIExpression()), !dbg !22
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68_badData, align 8, !dbg !23
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %1, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !45
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !46
  store i32 0, i32* %intOne, align 8, !dbg !47
  %3 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !49
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !50
  store i32 0, i32* %intTwo, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %4, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !58
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !59
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !59
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !59
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !60
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !61
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !62
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !62
  call void @free(i8* %10) #5, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68b_goodG2BSink() #0 !dbg !65 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68_goodG2BData, align 8, !dbg !68
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !69, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i64* %i, metadata !72, metadata !DIExpression()), !dbg !74
  store i64 0, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !78
  %cmp = icmp ult i64 %1, 100, !dbg !80
  br i1 %cmp, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !84
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !85
  store i32 0, i32* %intOne, align 8, !dbg !86
  %3 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !88
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !89
  store i32 0, i32* %intTwo, align 4, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !92
  %inc = add i64 %4, 1, !dbg !92
  store i64 %inc, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !97
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !97
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !97
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !97
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !98
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !99
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !100
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !100
  call void @free(i8* %10) #5, !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !16, line: 100, baseType: !17)
!16 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !16, line: 96, size: 64, elements: !18)
!18 = !{!19, !21}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !17, file: !16, line: 98, baseType: !20, size: 32)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !17, file: !16, line: 99, baseType: !20, size: 32, offset: 32)
!22 = !DILocation(line: 28, column: 21, scope: !9)
!23 = !DILocation(line: 28, column: 28, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 30, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 29, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 6400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 30, column: 23, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !10, line: 32, type: !32)
!31 = distinct !DILexicalBlock(scope: !25, file: !10, line: 31, column: 9)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!34 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 32, column: 20, scope: !31)
!36 = !DILocation(line: 34, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !10, line: 34, column: 13)
!38 = !DILocation(line: 34, column: 18, scope: !37)
!39 = !DILocation(line: 34, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 34, column: 13)
!41 = !DILocation(line: 34, column: 27, scope: !40)
!42 = !DILocation(line: 34, column: 13, scope: !37)
!43 = !DILocation(line: 36, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !10, line: 35, column: 13)
!45 = !DILocation(line: 36, column: 17, scope: !44)
!46 = !DILocation(line: 36, column: 27, scope: !44)
!47 = !DILocation(line: 36, column: 34, scope: !44)
!48 = !DILocation(line: 37, column: 24, scope: !44)
!49 = !DILocation(line: 37, column: 17, scope: !44)
!50 = !DILocation(line: 37, column: 27, scope: !44)
!51 = !DILocation(line: 37, column: 34, scope: !44)
!52 = !DILocation(line: 38, column: 13, scope: !44)
!53 = !DILocation(line: 34, column: 35, scope: !40)
!54 = !DILocation(line: 34, column: 13, scope: !40)
!55 = distinct !{!55, !42, !56, !57}
!56 = !DILocation(line: 38, column: 13, scope: !37)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 41, column: 17, scope: !25)
!59 = !DILocation(line: 41, column: 9, scope: !25)
!60 = !DILocation(line: 42, column: 26, scope: !25)
!61 = !DILocation(line: 42, column: 9, scope: !25)
!62 = !DILocation(line: 43, column: 14, scope: !25)
!63 = !DILocation(line: 43, column: 9, scope: !25)
!64 = !DILocation(line: 45, column: 1, scope: !9)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_68b_goodG2BSink", scope: !10, file: !10, line: 52, type: !11, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !10, line: 54, type: !14)
!67 = !DILocation(line: 54, column: 21, scope: !65)
!68 = !DILocation(line: 54, column: 28, scope: !65)
!69 = !DILocalVariable(name: "source", scope: !70, file: !10, line: 56, type: !26)
!70 = distinct !DILexicalBlock(scope: !65, file: !10, line: 55, column: 5)
!71 = !DILocation(line: 56, column: 23, scope: !70)
!72 = !DILocalVariable(name: "i", scope: !73, file: !10, line: 58, type: !32)
!73 = distinct !DILexicalBlock(scope: !70, file: !10, line: 57, column: 9)
!74 = !DILocation(line: 58, column: 20, scope: !73)
!75 = !DILocation(line: 60, column: 20, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !10, line: 60, column: 13)
!77 = !DILocation(line: 60, column: 18, scope: !76)
!78 = !DILocation(line: 60, column: 25, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !10, line: 60, column: 13)
!80 = !DILocation(line: 60, column: 27, scope: !79)
!81 = !DILocation(line: 60, column: 13, scope: !76)
!82 = !DILocation(line: 62, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !10, line: 61, column: 13)
!84 = !DILocation(line: 62, column: 17, scope: !83)
!85 = !DILocation(line: 62, column: 27, scope: !83)
!86 = !DILocation(line: 62, column: 34, scope: !83)
!87 = !DILocation(line: 63, column: 24, scope: !83)
!88 = !DILocation(line: 63, column: 17, scope: !83)
!89 = !DILocation(line: 63, column: 27, scope: !83)
!90 = !DILocation(line: 63, column: 34, scope: !83)
!91 = !DILocation(line: 64, column: 13, scope: !83)
!92 = !DILocation(line: 60, column: 35, scope: !79)
!93 = !DILocation(line: 60, column: 13, scope: !79)
!94 = distinct !{!94, !81, !95, !57}
!95 = !DILocation(line: 64, column: 13, scope: !76)
!96 = !DILocation(line: 67, column: 17, scope: !70)
!97 = !DILocation(line: 67, column: 9, scope: !70)
!98 = !DILocation(line: 68, column: 26, scope: !70)
!99 = !DILocation(line: 68, column: 9, scope: !70)
!100 = !DILocation(line: 69, column: 14, scope: !70)
!101 = !DILocation(line: 69, column: 9, scope: !70)
!102 = !DILocation(line: 71, column: 1, scope: !65)
