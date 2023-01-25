; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !41, metadata !DIExpression()), !dbg !42
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !43
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !56
  %cmp = icmp ult i64 %2, 100, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !62
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !63
  store i32 0, i32* %intOne, align 8, !dbg !64
  %4 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !66
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !67
  store i32 0, i32* %intTwo, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %5, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !75
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !76
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !76
  %8 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !76
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !77
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !77
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #5, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #5, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !112, metadata !DIExpression()), !dbg !114
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !115
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !116, metadata !DIExpression()), !dbg !117
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !118
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !128
  %cmp = icmp ult i64 %2, 100, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !134
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !135
  store i32 0, i32* %intOne, align 8, !dbg !136
  %4 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !138
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !139
  store i32 0, i32* %intTwo, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %5, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !146
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !147
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !147
  %8 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !147
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !148
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !148
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !149
  ret void, !dbg !150
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 23, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 24, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 25, column: 19, scope: !11)
!35 = !DILocation(line: 28, column: 12, scope: !11)
!36 = !DILocation(line: 28, column: 10, scope: !11)
!37 = !DILocalVariable(name: "dataCopy", scope: !38, file: !12, line: 30, type: !16)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!39 = !DILocation(line: 30, column: 25, scope: !38)
!40 = !DILocation(line: 30, column: 36, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !12, line: 31, type: !16)
!42 = !DILocation(line: 31, column: 25, scope: !38)
!43 = !DILocation(line: 31, column: 32, scope: !38)
!44 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 33, type: !31)
!45 = distinct !DILexicalBlock(scope: !38, file: !12, line: 32, column: 9)
!46 = !DILocation(line: 33, column: 27, scope: !45)
!47 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 35, type: !49)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 34, column: 13)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 35, column: 24, scope: !48)
!53 = !DILocation(line: 37, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !12, line: 37, column: 17)
!55 = !DILocation(line: 37, column: 22, scope: !54)
!56 = !DILocation(line: 37, column: 29, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 37, column: 17)
!58 = !DILocation(line: 37, column: 31, scope: !57)
!59 = !DILocation(line: 37, column: 17, scope: !54)
!60 = !DILocation(line: 39, column: 28, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !12, line: 38, column: 17)
!62 = !DILocation(line: 39, column: 21, scope: !61)
!63 = !DILocation(line: 39, column: 31, scope: !61)
!64 = !DILocation(line: 39, column: 38, scope: !61)
!65 = !DILocation(line: 40, column: 28, scope: !61)
!66 = !DILocation(line: 40, column: 21, scope: !61)
!67 = !DILocation(line: 40, column: 31, scope: !61)
!68 = !DILocation(line: 40, column: 38, scope: !61)
!69 = !DILocation(line: 41, column: 17, scope: !61)
!70 = !DILocation(line: 37, column: 39, scope: !57)
!71 = !DILocation(line: 37, column: 17, scope: !57)
!72 = distinct !{!72, !59, !73, !74}
!73 = !DILocation(line: 41, column: 17, scope: !54)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 44, column: 20, scope: !45)
!76 = !DILocation(line: 44, column: 13, scope: !45)
!77 = !DILocation(line: 45, column: 30, scope: !45)
!78 = !DILocation(line: 45, column: 13, scope: !45)
!79 = !DILocation(line: 48, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_31_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 85, column: 5, scope: !80)
!82 = !DILocation(line: 86, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !84, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!22, !22, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 97, type: !22)
!90 = !DILocation(line: 97, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 97, type: !86)
!92 = !DILocation(line: 97, column: 27, scope: !83)
!93 = !DILocation(line: 100, column: 22, scope: !83)
!94 = !DILocation(line: 100, column: 12, scope: !83)
!95 = !DILocation(line: 100, column: 5, scope: !83)
!96 = !DILocation(line: 102, column: 5, scope: !83)
!97 = !DILocation(line: 103, column: 5, scope: !83)
!98 = !DILocation(line: 104, column: 5, scope: !83)
!99 = !DILocation(line: 107, column: 5, scope: !83)
!100 = !DILocation(line: 108, column: 5, scope: !83)
!101 = !DILocation(line: 109, column: 5, scope: !83)
!102 = !DILocation(line: 111, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 57, type: !16)
!105 = !DILocation(line: 57, column: 21, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 58, type: !26)
!107 = !DILocation(line: 58, column: 19, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 59, type: !31)
!109 = !DILocation(line: 59, column: 19, scope: !103)
!110 = !DILocation(line: 61, column: 12, scope: !103)
!111 = !DILocation(line: 61, column: 10, scope: !103)
!112 = !DILocalVariable(name: "dataCopy", scope: !113, file: !12, line: 63, type: !16)
!113 = distinct !DILexicalBlock(scope: !103, file: !12, line: 62, column: 5)
!114 = !DILocation(line: 63, column: 25, scope: !113)
!115 = !DILocation(line: 63, column: 36, scope: !113)
!116 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 64, type: !16)
!117 = !DILocation(line: 64, column: 25, scope: !113)
!118 = !DILocation(line: 64, column: 32, scope: !113)
!119 = !DILocalVariable(name: "source", scope: !120, file: !12, line: 66, type: !31)
!120 = distinct !DILexicalBlock(scope: !113, file: !12, line: 65, column: 9)
!121 = !DILocation(line: 66, column: 27, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !123, file: !12, line: 68, type: !49)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 67, column: 13)
!124 = !DILocation(line: 68, column: 24, scope: !123)
!125 = !DILocation(line: 70, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 70, column: 17)
!127 = !DILocation(line: 70, column: 22, scope: !126)
!128 = !DILocation(line: 70, column: 29, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 70, column: 17)
!130 = !DILocation(line: 70, column: 31, scope: !129)
!131 = !DILocation(line: 70, column: 17, scope: !126)
!132 = !DILocation(line: 72, column: 28, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 71, column: 17)
!134 = !DILocation(line: 72, column: 21, scope: !133)
!135 = !DILocation(line: 72, column: 31, scope: !133)
!136 = !DILocation(line: 72, column: 38, scope: !133)
!137 = !DILocation(line: 73, column: 28, scope: !133)
!138 = !DILocation(line: 73, column: 21, scope: !133)
!139 = !DILocation(line: 73, column: 31, scope: !133)
!140 = !DILocation(line: 73, column: 38, scope: !133)
!141 = !DILocation(line: 74, column: 17, scope: !133)
!142 = !DILocation(line: 70, column: 39, scope: !129)
!143 = !DILocation(line: 70, column: 17, scope: !129)
!144 = distinct !{!144, !131, !145, !74}
!145 = !DILocation(line: 74, column: 17, scope: !126)
!146 = !DILocation(line: 77, column: 20, scope: !120)
!147 = !DILocation(line: 77, column: 13, scope: !120)
!148 = !DILocation(line: 78, column: 30, scope: !120)
!149 = !DILocation(line: 78, column: 13, scope: !120)
!150 = !DILocation(line: 81, column: 1, scope: !103)
