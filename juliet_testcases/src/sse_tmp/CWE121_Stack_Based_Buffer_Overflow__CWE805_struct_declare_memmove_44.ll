; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !25, metadata !DIExpression()), !dbg !29
  store void (%struct._twoIntsStruct*)* @badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %0 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !42
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  call void %0(%struct._twoIntsStruct* %1), !dbg !42
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(%struct._twoIntsStruct* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !48, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %0, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !66
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !67
  store i32 0, i32* %intOne, align 8, !dbg !68
  %2 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !70
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !71
  store i32 0, i32* %intTwo, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %3, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !79
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !80
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !80
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !80
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !80
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !81
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !81
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #5, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #5, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !110, metadata !DIExpression()), !dbg !111
  store void (%struct._twoIntsStruct*)* @goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !117
  %0 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !118
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !119
  call void %0(%struct._twoIntsStruct* %1), !dbg !118
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !121 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %0, 100, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !139
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !140
  store i32 0, i32* %intOne, align 8, !dbg !141
  %2 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !143
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !144
  store i32 0, i32* %intTwo, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %3, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !151
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !152
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !152
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !152
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !152
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !153
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !153
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44_bad", scope: !12, file: !12, line: 40, type: !13, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 42, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 42, column: 21, scope: !11)
!25 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 44, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !16}
!29 = !DILocation(line: 44, column: 12, scope: !11)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 45, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 45, column: 19, scope: !11)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 46, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 46, column: 19, scope: !11)
!40 = !DILocation(line: 49, column: 12, scope: !11)
!41 = !DILocation(line: 49, column: 10, scope: !11)
!42 = !DILocation(line: 51, column: 5, scope: !11)
!43 = !DILocation(line: 51, column: 13, scope: !11)
!44 = !DILocation(line: 52, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 21, type: !27, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !12, line: 21, type: !16)
!47 = !DILocation(line: 21, column: 37, scope: !45)
!48 = !DILocalVariable(name: "source", scope: !49, file: !12, line: 24, type: !36)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 23, column: 5)
!50 = !DILocation(line: 24, column: 23, scope: !49)
!51 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 26, type: !53)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 25, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 26, column: 20, scope: !52)
!57 = !DILocation(line: 28, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !12, line: 28, column: 13)
!59 = !DILocation(line: 28, column: 18, scope: !58)
!60 = !DILocation(line: 28, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 28, column: 13)
!62 = !DILocation(line: 28, column: 27, scope: !61)
!63 = !DILocation(line: 28, column: 13, scope: !58)
!64 = !DILocation(line: 30, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !12, line: 29, column: 13)
!66 = !DILocation(line: 30, column: 17, scope: !65)
!67 = !DILocation(line: 30, column: 27, scope: !65)
!68 = !DILocation(line: 30, column: 34, scope: !65)
!69 = !DILocation(line: 31, column: 24, scope: !65)
!70 = !DILocation(line: 31, column: 17, scope: !65)
!71 = !DILocation(line: 31, column: 27, scope: !65)
!72 = !DILocation(line: 31, column: 34, scope: !65)
!73 = !DILocation(line: 32, column: 13, scope: !65)
!74 = !DILocation(line: 28, column: 35, scope: !61)
!75 = !DILocation(line: 28, column: 13, scope: !61)
!76 = distinct !{!76, !63, !77, !78}
!77 = !DILocation(line: 32, column: 13, scope: !58)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 35, column: 17, scope: !49)
!80 = !DILocation(line: 35, column: 9, scope: !49)
!81 = !DILocation(line: 36, column: 26, scope: !49)
!82 = !DILocation(line: 36, column: 9, scope: !49)
!83 = !DILocation(line: 38, column: 1, scope: !45)
!84 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_44_good", scope: !12, file: !12, line: 89, type: !13, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 91, column: 5, scope: !84)
!86 = !DILocation(line: 92, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !88, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!22, !22, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !12, line: 103, type: !22)
!94 = !DILocation(line: 103, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !12, line: 103, type: !90)
!96 = !DILocation(line: 103, column: 27, scope: !87)
!97 = !DILocation(line: 106, column: 22, scope: !87)
!98 = !DILocation(line: 106, column: 12, scope: !87)
!99 = !DILocation(line: 106, column: 5, scope: !87)
!100 = !DILocation(line: 108, column: 5, scope: !87)
!101 = !DILocation(line: 109, column: 5, scope: !87)
!102 = !DILocation(line: 110, column: 5, scope: !87)
!103 = !DILocation(line: 113, column: 5, scope: !87)
!104 = !DILocation(line: 114, column: 5, scope: !87)
!105 = !DILocation(line: 115, column: 5, scope: !87)
!106 = !DILocation(line: 117, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 80, type: !16)
!109 = !DILocation(line: 80, column: 21, scope: !107)
!110 = !DILocalVariable(name: "funcPtr", scope: !107, file: !12, line: 81, type: !26)
!111 = !DILocation(line: 81, column: 12, scope: !107)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !12, line: 82, type: !31)
!113 = !DILocation(line: 82, column: 19, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !12, line: 83, type: !36)
!115 = !DILocation(line: 83, column: 19, scope: !107)
!116 = !DILocation(line: 85, column: 12, scope: !107)
!117 = !DILocation(line: 85, column: 10, scope: !107)
!118 = !DILocation(line: 86, column: 5, scope: !107)
!119 = !DILocation(line: 86, column: 13, scope: !107)
!120 = !DILocation(line: 87, column: 1, scope: !107)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 59, type: !27, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", arg: 1, scope: !121, file: !12, line: 59, type: !16)
!123 = !DILocation(line: 59, column: 41, scope: !121)
!124 = !DILocalVariable(name: "source", scope: !125, file: !12, line: 62, type: !36)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 61, column: 5)
!126 = !DILocation(line: 62, column: 23, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 64, type: !53)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 63, column: 9)
!129 = !DILocation(line: 64, column: 20, scope: !128)
!130 = !DILocation(line: 66, column: 20, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 66, column: 13)
!132 = !DILocation(line: 66, column: 18, scope: !131)
!133 = !DILocation(line: 66, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 66, column: 13)
!135 = !DILocation(line: 66, column: 27, scope: !134)
!136 = !DILocation(line: 66, column: 13, scope: !131)
!137 = !DILocation(line: 68, column: 24, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 67, column: 13)
!139 = !DILocation(line: 68, column: 17, scope: !138)
!140 = !DILocation(line: 68, column: 27, scope: !138)
!141 = !DILocation(line: 68, column: 34, scope: !138)
!142 = !DILocation(line: 69, column: 24, scope: !138)
!143 = !DILocation(line: 69, column: 17, scope: !138)
!144 = !DILocation(line: 69, column: 27, scope: !138)
!145 = !DILocation(line: 69, column: 34, scope: !138)
!146 = !DILocation(line: 70, column: 13, scope: !138)
!147 = !DILocation(line: 66, column: 35, scope: !134)
!148 = !DILocation(line: 66, column: 13, scope: !134)
!149 = distinct !{!149, !136, !150, !78}
!150 = !DILocation(line: 70, column: 13, scope: !131)
!151 = !DILocation(line: 73, column: 17, scope: !125)
!152 = !DILocation(line: 73, column: 9, scope: !125)
!153 = !DILocation(line: 74, column: 26, scope: !125)
!154 = !DILocation(line: 74, column: 9, scope: !125)
!155 = !DILocation(line: 76, column: 1, scope: !121)
