; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !33
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !41
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %7, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !63
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !64
  store i32 0, i32* %intOne, align 8, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !67
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !68
  store i32 0, i32* %intTwo, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %10, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !76
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !77
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !77
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !77
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %12, i8* align 16 %13, i64 800, i1 false), !dbg !77
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !78
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !110
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 800, align 16, !dbg !113
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !114
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !112
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !115
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !117, metadata !DIExpression()), !dbg !119
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !120
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !121, metadata !DIExpression()), !dbg !122
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !123
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %7, 100, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !139
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !140
  store i32 0, i32* %intOne, align 8, !dbg !141
  %9 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !143
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !144
  store i32 0, i32* %intTwo, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %10, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !151
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !152
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !152
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !152
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %12, i8* align 16 %13, i64 800, i1 false), !dbg !152
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !153
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !153
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !4)
!24 = !DILocation(line: 23, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 21, scope: !19)
!27 = !DILocation(line: 24, column: 54, scope: !19)
!28 = !DILocation(line: 24, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 25, type: !4)
!30 = !DILocation(line: 25, column: 21, scope: !19)
!31 = !DILocation(line: 25, column: 55, scope: !19)
!32 = !DILocation(line: 25, column: 38, scope: !19)
!33 = !DILocation(line: 28, column: 12, scope: !19)
!34 = !DILocation(line: 28, column: 10, scope: !19)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !20, line: 30, type: !4)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 29, column: 5)
!37 = !DILocation(line: 30, column: 25, scope: !36)
!38 = !DILocation(line: 30, column: 36, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !20, line: 31, type: !4)
!40 = !DILocation(line: 31, column: 25, scope: !36)
!41 = !DILocation(line: 31, column: 32, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !20, line: 33, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !20, line: 32, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 33, column: 27, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !49, file: !20, line: 35, type: !50)
!49 = distinct !DILexicalBlock(scope: !43, file: !20, line: 34, column: 13)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 46, baseType: !52)
!51 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 35, column: 24, scope: !49)
!54 = !DILocation(line: 37, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !20, line: 37, column: 17)
!56 = !DILocation(line: 37, column: 22, scope: !55)
!57 = !DILocation(line: 37, column: 29, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !20, line: 37, column: 17)
!59 = !DILocation(line: 37, column: 31, scope: !58)
!60 = !DILocation(line: 37, column: 17, scope: !55)
!61 = !DILocation(line: 39, column: 28, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !20, line: 38, column: 17)
!63 = !DILocation(line: 39, column: 21, scope: !62)
!64 = !DILocation(line: 39, column: 31, scope: !62)
!65 = !DILocation(line: 39, column: 38, scope: !62)
!66 = !DILocation(line: 40, column: 28, scope: !62)
!67 = !DILocation(line: 40, column: 21, scope: !62)
!68 = !DILocation(line: 40, column: 31, scope: !62)
!69 = !DILocation(line: 40, column: 38, scope: !62)
!70 = !DILocation(line: 41, column: 17, scope: !62)
!71 = !DILocation(line: 37, column: 39, scope: !58)
!72 = !DILocation(line: 37, column: 17, scope: !58)
!73 = distinct !{!73, !60, !74, !75}
!74 = !DILocation(line: 41, column: 17, scope: !55)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 44, column: 21, scope: !43)
!77 = !DILocation(line: 44, column: 13, scope: !43)
!78 = !DILocation(line: 45, column: 30, scope: !43)
!79 = !DILocation(line: 45, column: 13, scope: !43)
!80 = !DILocation(line: 48, column: 1, scope: !19)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_31_good", scope: !20, file: !20, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 85, column: 5, scope: !81)
!83 = !DILocation(line: 86, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 97, type: !85, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!10, !10, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !20, line: 97, type: !10)
!91 = !DILocation(line: 97, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !20, line: 97, type: !87)
!93 = !DILocation(line: 97, column: 27, scope: !84)
!94 = !DILocation(line: 100, column: 22, scope: !84)
!95 = !DILocation(line: 100, column: 12, scope: !84)
!96 = !DILocation(line: 100, column: 5, scope: !84)
!97 = !DILocation(line: 102, column: 5, scope: !84)
!98 = !DILocation(line: 103, column: 5, scope: !84)
!99 = !DILocation(line: 104, column: 5, scope: !84)
!100 = !DILocation(line: 107, column: 5, scope: !84)
!101 = !DILocation(line: 108, column: 5, scope: !84)
!102 = !DILocation(line: 109, column: 5, scope: !84)
!103 = !DILocation(line: 111, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !20, line: 57, type: !4)
!106 = !DILocation(line: 57, column: 21, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !20, line: 58, type: !4)
!108 = !DILocation(line: 58, column: 21, scope: !104)
!109 = !DILocation(line: 58, column: 54, scope: !104)
!110 = !DILocation(line: 58, column: 37, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !20, line: 59, type: !4)
!112 = !DILocation(line: 59, column: 21, scope: !104)
!113 = !DILocation(line: 59, column: 55, scope: !104)
!114 = !DILocation(line: 59, column: 38, scope: !104)
!115 = !DILocation(line: 61, column: 12, scope: !104)
!116 = !DILocation(line: 61, column: 10, scope: !104)
!117 = !DILocalVariable(name: "dataCopy", scope: !118, file: !20, line: 63, type: !4)
!118 = distinct !DILexicalBlock(scope: !104, file: !20, line: 62, column: 5)
!119 = !DILocation(line: 63, column: 25, scope: !118)
!120 = !DILocation(line: 63, column: 36, scope: !118)
!121 = !DILocalVariable(name: "data", scope: !118, file: !20, line: 64, type: !4)
!122 = !DILocation(line: 64, column: 25, scope: !118)
!123 = !DILocation(line: 64, column: 32, scope: !118)
!124 = !DILocalVariable(name: "source", scope: !125, file: !20, line: 66, type: !44)
!125 = distinct !DILexicalBlock(scope: !118, file: !20, line: 65, column: 9)
!126 = !DILocation(line: 66, column: 27, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !128, file: !20, line: 68, type: !50)
!128 = distinct !DILexicalBlock(scope: !125, file: !20, line: 67, column: 13)
!129 = !DILocation(line: 68, column: 24, scope: !128)
!130 = !DILocation(line: 70, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !20, line: 70, column: 17)
!132 = !DILocation(line: 70, column: 22, scope: !131)
!133 = !DILocation(line: 70, column: 29, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !20, line: 70, column: 17)
!135 = !DILocation(line: 70, column: 31, scope: !134)
!136 = !DILocation(line: 70, column: 17, scope: !131)
!137 = !DILocation(line: 72, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !20, line: 71, column: 17)
!139 = !DILocation(line: 72, column: 21, scope: !138)
!140 = !DILocation(line: 72, column: 31, scope: !138)
!141 = !DILocation(line: 72, column: 38, scope: !138)
!142 = !DILocation(line: 73, column: 28, scope: !138)
!143 = !DILocation(line: 73, column: 21, scope: !138)
!144 = !DILocation(line: 73, column: 31, scope: !138)
!145 = !DILocation(line: 73, column: 38, scope: !138)
!146 = !DILocation(line: 74, column: 17, scope: !138)
!147 = !DILocation(line: 70, column: 39, scope: !134)
!148 = !DILocation(line: 70, column: 17, scope: !134)
!149 = distinct !{!149, !136, !150, !75}
!150 = !DILocation(line: 74, column: 17, scope: !131)
!151 = !DILocation(line: 77, column: 21, scope: !125)
!152 = !DILocation(line: 77, column: 13, scope: !125)
!153 = !DILocation(line: 78, column: 30, scope: !125)
!154 = !DILocation(line: 78, column: 13, scope: !125)
!155 = !DILocation(line: 81, column: 1, scope: !104)
