; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b_badSink(%struct._twoIntsStruct* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %0, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !44
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !45
  store i32 0, i32* %intOne, align 8, !dbg !46
  %2 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !48
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !49
  store i32 0, i32* %intTwo, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %3, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !57
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !58
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !58
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !58
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !59
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b_goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !62 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !65, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !70
  store i64 0, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !74
  %cmp = icmp ult i64 %0, 100, !dbg !76
  br i1 %cmp, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !80
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !81
  store i32 0, i32* %intOne, align 8, !dbg !82
  %2 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !84
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !85
  store i32 0, i32* %intTwo, align 4, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !88
  %inc = add i64 %3, 1, !dbg !88
  store i64 %inc, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !92
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !93
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !93
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !93
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !94
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !94
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !95
  ret void, !dbg !96
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !15, line: 100, baseType: !16)
!15 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !15, line: 96, size: 64, elements: !17)
!17 = !{!18, !20}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !16, file: !15, line: 98, baseType: !19, size: 32)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !16, file: !15, line: 99, baseType: !19, size: 32, offset: 32)
!21 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!22 = !DILocation(line: 21, column: 98, scope: !9)
!23 = !DILocalVariable(name: "source", scope: !24, file: !10, line: 24, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 23, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 6400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 24, column: 23, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !30, file: !10, line: 26, type: !31)
!30 = distinct !DILexicalBlock(scope: !24, file: !10, line: 25, column: 9)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 26, column: 20, scope: !30)
!35 = !DILocation(line: 28, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !10, line: 28, column: 13)
!37 = !DILocation(line: 28, column: 18, scope: !36)
!38 = !DILocation(line: 28, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 28, column: 13)
!40 = !DILocation(line: 28, column: 27, scope: !39)
!41 = !DILocation(line: 28, column: 13, scope: !36)
!42 = !DILocation(line: 30, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 29, column: 13)
!44 = !DILocation(line: 30, column: 17, scope: !43)
!45 = !DILocation(line: 30, column: 27, scope: !43)
!46 = !DILocation(line: 30, column: 34, scope: !43)
!47 = !DILocation(line: 31, column: 24, scope: !43)
!48 = !DILocation(line: 31, column: 17, scope: !43)
!49 = !DILocation(line: 31, column: 27, scope: !43)
!50 = !DILocation(line: 31, column: 34, scope: !43)
!51 = !DILocation(line: 32, column: 13, scope: !43)
!52 = !DILocation(line: 28, column: 35, scope: !39)
!53 = !DILocation(line: 28, column: 13, scope: !39)
!54 = distinct !{!54, !41, !55, !56}
!55 = !DILocation(line: 32, column: 13, scope: !36)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 35, column: 16, scope: !24)
!58 = !DILocation(line: 35, column: 9, scope: !24)
!59 = !DILocation(line: 36, column: 26, scope: !24)
!60 = !DILocation(line: 36, column: 9, scope: !24)
!61 = !DILocation(line: 38, column: 1, scope: !9)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_65b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", arg: 1, scope: !62, file: !10, line: 45, type: !13)
!64 = !DILocation(line: 45, column: 102, scope: !62)
!65 = !DILocalVariable(name: "source", scope: !66, file: !10, line: 48, type: !25)
!66 = distinct !DILexicalBlock(scope: !62, file: !10, line: 47, column: 5)
!67 = !DILocation(line: 48, column: 23, scope: !66)
!68 = !DILocalVariable(name: "i", scope: !69, file: !10, line: 50, type: !31)
!69 = distinct !DILexicalBlock(scope: !66, file: !10, line: 49, column: 9)
!70 = !DILocation(line: 50, column: 20, scope: !69)
!71 = !DILocation(line: 52, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !10, line: 52, column: 13)
!73 = !DILocation(line: 52, column: 18, scope: !72)
!74 = !DILocation(line: 52, column: 25, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 52, column: 13)
!76 = !DILocation(line: 52, column: 27, scope: !75)
!77 = !DILocation(line: 52, column: 13, scope: !72)
!78 = !DILocation(line: 54, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !10, line: 53, column: 13)
!80 = !DILocation(line: 54, column: 17, scope: !79)
!81 = !DILocation(line: 54, column: 27, scope: !79)
!82 = !DILocation(line: 54, column: 34, scope: !79)
!83 = !DILocation(line: 55, column: 24, scope: !79)
!84 = !DILocation(line: 55, column: 17, scope: !79)
!85 = !DILocation(line: 55, column: 27, scope: !79)
!86 = !DILocation(line: 55, column: 34, scope: !79)
!87 = !DILocation(line: 56, column: 13, scope: !79)
!88 = !DILocation(line: 52, column: 35, scope: !75)
!89 = !DILocation(line: 52, column: 13, scope: !75)
!90 = distinct !{!90, !77, !91, !56}
!91 = !DILocation(line: 56, column: 13, scope: !72)
!92 = !DILocation(line: 59, column: 16, scope: !66)
!93 = !DILocation(line: 59, column: 9, scope: !66)
!94 = !DILocation(line: 60, column: 26, scope: !66)
!95 = !DILocation(line: 60, column: 9, scope: !66)
!96 = !DILocation(line: 62, column: 1, scope: !62)
