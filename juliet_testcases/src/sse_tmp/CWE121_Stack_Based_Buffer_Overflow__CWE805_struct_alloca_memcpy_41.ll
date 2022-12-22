; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_badSink(%struct._twoIntsStruct* %data) #0 !dbg !19 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !25, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %0, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !46
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !47
  store i32 0, i32* %intOne, align 8, !dbg !48
  %2 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !50
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !51
  store i32 0, i32* %intTwo, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %3, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !59
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !60
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !60
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !60
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !60
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !61
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_bad() #0 !dbg !64 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 400, align 16, !dbg !71
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !72
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = alloca i8, i64 800, align 16, !dbg !75
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !76
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !74
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !77
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_badSink(%struct._twoIntsStruct* %5), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !82 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i64* %i, metadata !88, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !94
  %cmp = icmp ult i64 %0, 100, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !100
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !101
  store i32 0, i32* %intOne, align 8, !dbg !102
  %2 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !104
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !105
  store i32 0, i32* %intTwo, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %3, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !112
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !113
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !113
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !113
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !114
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !114
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_good() #0 !dbg !117 {
entry:
  call void @goodG2B(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !120 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !126, metadata !DIExpression()), !dbg !127
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !128, metadata !DIExpression()), !dbg !129
  %call = call i64 @time(i64* null) #5, !dbg !130
  %conv = trunc i64 %call to i32, !dbg !131
  call void @srand(i32 %conv) #5, !dbg !132
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !133
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_good(), !dbg !134
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !135
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !136
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_bad(), !dbg !137
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !138
  ret i32 0, !dbg !139
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !140 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !143, metadata !DIExpression()), !dbg !144
  %0 = alloca i8, i64 400, align 16, !dbg !145
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !146
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %2 = alloca i8, i64 800, align 16, !dbg !149
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !150
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !148
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !151
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !153
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_goodG2BSink(%struct._twoIntsStruct* %5), !dbg !154
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_badSink", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !20, line: 21, type: !4)
!24 = !DILocation(line: 21, column: 97, scope: !19)
!25 = !DILocalVariable(name: "source", scope: !26, file: !20, line: 24, type: !27)
!26 = distinct !DILexicalBlock(scope: !19, file: !20, line: 23, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 24, column: 23, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !32, file: !20, line: 26, type: !33)
!32 = distinct !DILexicalBlock(scope: !26, file: !20, line: 25, column: 9)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 26, column: 20, scope: !32)
!37 = !DILocation(line: 28, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !20, line: 28, column: 13)
!39 = !DILocation(line: 28, column: 18, scope: !38)
!40 = !DILocation(line: 28, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !20, line: 28, column: 13)
!42 = !DILocation(line: 28, column: 27, scope: !41)
!43 = !DILocation(line: 28, column: 13, scope: !38)
!44 = !DILocation(line: 30, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !20, line: 29, column: 13)
!46 = !DILocation(line: 30, column: 17, scope: !45)
!47 = !DILocation(line: 30, column: 27, scope: !45)
!48 = !DILocation(line: 30, column: 34, scope: !45)
!49 = !DILocation(line: 31, column: 24, scope: !45)
!50 = !DILocation(line: 31, column: 17, scope: !45)
!51 = !DILocation(line: 31, column: 27, scope: !45)
!52 = !DILocation(line: 31, column: 34, scope: !45)
!53 = !DILocation(line: 32, column: 13, scope: !45)
!54 = !DILocation(line: 28, column: 35, scope: !41)
!55 = !DILocation(line: 28, column: 13, scope: !41)
!56 = distinct !{!56, !43, !57, !58}
!57 = !DILocation(line: 32, column: 13, scope: !38)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 35, column: 16, scope: !26)
!60 = !DILocation(line: 35, column: 9, scope: !26)
!61 = !DILocation(line: 36, column: 26, scope: !26)
!62 = !DILocation(line: 36, column: 9, scope: !26)
!63 = !DILocation(line: 38, column: 1, scope: !19)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_bad", scope: !20, file: !20, line: 40, type: !65, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null}
!67 = !DILocalVariable(name: "data", scope: !64, file: !20, line: 42, type: !4)
!68 = !DILocation(line: 42, column: 21, scope: !64)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !64, file: !20, line: 43, type: !4)
!70 = !DILocation(line: 43, column: 21, scope: !64)
!71 = !DILocation(line: 43, column: 54, scope: !64)
!72 = !DILocation(line: 43, column: 37, scope: !64)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !64, file: !20, line: 44, type: !4)
!74 = !DILocation(line: 44, column: 21, scope: !64)
!75 = !DILocation(line: 44, column: 55, scope: !64)
!76 = !DILocation(line: 44, column: 38, scope: !64)
!77 = !DILocation(line: 47, column: 12, scope: !64)
!78 = !DILocation(line: 47, column: 10, scope: !64)
!79 = !DILocation(line: 48, column: 80, scope: !64)
!80 = !DILocation(line: 48, column: 5, scope: !64)
!81 = !DILocation(line: 49, column: 1, scope: !64)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_goodG2BSink", scope: !20, file: !20, line: 55, type: !21, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", arg: 1, scope: !82, file: !20, line: 55, type: !4)
!84 = !DILocation(line: 55, column: 101, scope: !82)
!85 = !DILocalVariable(name: "source", scope: !86, file: !20, line: 58, type: !27)
!86 = distinct !DILexicalBlock(scope: !82, file: !20, line: 57, column: 5)
!87 = !DILocation(line: 58, column: 23, scope: !86)
!88 = !DILocalVariable(name: "i", scope: !89, file: !20, line: 60, type: !33)
!89 = distinct !DILexicalBlock(scope: !86, file: !20, line: 59, column: 9)
!90 = !DILocation(line: 60, column: 20, scope: !89)
!91 = !DILocation(line: 62, column: 20, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !20, line: 62, column: 13)
!93 = !DILocation(line: 62, column: 18, scope: !92)
!94 = !DILocation(line: 62, column: 25, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !20, line: 62, column: 13)
!96 = !DILocation(line: 62, column: 27, scope: !95)
!97 = !DILocation(line: 62, column: 13, scope: !92)
!98 = !DILocation(line: 64, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !20, line: 63, column: 13)
!100 = !DILocation(line: 64, column: 17, scope: !99)
!101 = !DILocation(line: 64, column: 27, scope: !99)
!102 = !DILocation(line: 64, column: 34, scope: !99)
!103 = !DILocation(line: 65, column: 24, scope: !99)
!104 = !DILocation(line: 65, column: 17, scope: !99)
!105 = !DILocation(line: 65, column: 27, scope: !99)
!106 = !DILocation(line: 65, column: 34, scope: !99)
!107 = !DILocation(line: 66, column: 13, scope: !99)
!108 = !DILocation(line: 62, column: 35, scope: !95)
!109 = !DILocation(line: 62, column: 13, scope: !95)
!110 = distinct !{!110, !97, !111, !58}
!111 = !DILocation(line: 66, column: 13, scope: !92)
!112 = !DILocation(line: 69, column: 16, scope: !86)
!113 = !DILocation(line: 69, column: 9, scope: !86)
!114 = !DILocation(line: 70, column: 26, scope: !86)
!115 = !DILocation(line: 70, column: 9, scope: !86)
!116 = !DILocation(line: 72, column: 1, scope: !82)
!117 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_41_good", scope: !20, file: !20, line: 85, type: !65, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocation(line: 87, column: 5, scope: !117)
!119 = !DILocation(line: 88, column: 1, scope: !117)
!120 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 100, type: !121, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DISubroutineType(types: !122)
!122 = !{!10, !10, !123}
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64)
!125 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!126 = !DILocalVariable(name: "argc", arg: 1, scope: !120, file: !20, line: 100, type: !10)
!127 = !DILocation(line: 100, column: 14, scope: !120)
!128 = !DILocalVariable(name: "argv", arg: 2, scope: !120, file: !20, line: 100, type: !123)
!129 = !DILocation(line: 100, column: 27, scope: !120)
!130 = !DILocation(line: 103, column: 22, scope: !120)
!131 = !DILocation(line: 103, column: 12, scope: !120)
!132 = !DILocation(line: 103, column: 5, scope: !120)
!133 = !DILocation(line: 105, column: 5, scope: !120)
!134 = !DILocation(line: 106, column: 5, scope: !120)
!135 = !DILocation(line: 107, column: 5, scope: !120)
!136 = !DILocation(line: 110, column: 5, scope: !120)
!137 = !DILocation(line: 111, column: 5, scope: !120)
!138 = !DILocation(line: 112, column: 5, scope: !120)
!139 = !DILocation(line: 114, column: 5, scope: !120)
!140 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 75, type: !65, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!141 = !DILocalVariable(name: "data", scope: !140, file: !20, line: 77, type: !4)
!142 = !DILocation(line: 77, column: 21, scope: !140)
!143 = !DILocalVariable(name: "dataBadBuffer", scope: !140, file: !20, line: 78, type: !4)
!144 = !DILocation(line: 78, column: 21, scope: !140)
!145 = !DILocation(line: 78, column: 54, scope: !140)
!146 = !DILocation(line: 78, column: 37, scope: !140)
!147 = !DILocalVariable(name: "dataGoodBuffer", scope: !140, file: !20, line: 79, type: !4)
!148 = !DILocation(line: 79, column: 21, scope: !140)
!149 = !DILocation(line: 79, column: 55, scope: !140)
!150 = !DILocation(line: 79, column: 38, scope: !140)
!151 = !DILocation(line: 81, column: 12, scope: !140)
!152 = !DILocation(line: 81, column: 10, scope: !140)
!153 = !DILocation(line: 82, column: 84, scope: !140)
!154 = !DILocation(line: 82, column: 5, scope: !140)
!155 = !DILocation(line: 83, column: 1, scope: !140)
