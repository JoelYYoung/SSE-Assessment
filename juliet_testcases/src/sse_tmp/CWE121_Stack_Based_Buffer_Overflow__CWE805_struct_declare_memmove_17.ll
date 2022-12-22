; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !18, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !40
  %cmp = icmp slt i32 %0, 1, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !44
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %1, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !56, metadata !DIExpression()), !dbg !61
  store i64 0, i64* %i1, align 8, !dbg !62
  br label %for.cond2, !dbg !64

for.cond2:                                        ; preds = %for.inc6, %for.end
  %2 = load i64, i64* %i1, align 8, !dbg !65
  %cmp3 = icmp ult i64 %2, 100, !dbg !67
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !68

for.body4:                                        ; preds = %for.cond2
  %3 = load i64, i64* %i1, align 8, !dbg !69
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !71
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !72
  store i32 0, i32* %intOne, align 8, !dbg !73
  %4 = load i64, i64* %i1, align 8, !dbg !74
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !75
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !76
  store i32 0, i32* %intTwo, align 4, !dbg !77
  br label %for.inc6, !dbg !78

for.inc6:                                         ; preds = %for.body4
  %5 = load i64, i64* %i1, align 8, !dbg !79
  %inc7 = add i64 %5, 1, !dbg !79
  store i64 %inc7, i64* %i1, align 8, !dbg !79
  br label %for.cond2, !dbg !80, !llvm.loop !81

for.end8:                                         ; preds = %for.cond2
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !84
  %arraydecay9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !84
  %8 = bitcast %struct._twoIntsStruct* %arraydecay9 to i8*, !dbg !84
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !84
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !85
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !85
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx10), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #5, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #5, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 0, i32* %h, align 4, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !123
  %cmp = icmp slt i32 %0, 1, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !131
  %inc = add nsw i32 %1, 1, !dbg !131
  store i32 %inc, i32* %h, align 4, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond1, !dbg !143

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i64, i64* %i, align 8, !dbg !144
  %cmp2 = icmp ult i64 %2, 100, !dbg !146
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !147

for.body3:                                        ; preds = %for.cond1
  %3 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !150
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !151
  store i32 0, i32* %intOne, align 8, !dbg !152
  %4 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !154
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !155
  store i32 0, i32* %intTwo, align 4, !dbg !156
  br label %for.inc5, !dbg !157

for.inc5:                                         ; preds = %for.body3
  %5 = load i64, i64* %i, align 8, !dbg !158
  %inc6 = add i64 %5, 1, !dbg !158
  store i64 %inc6, i64* %i, align 8, !dbg !158
  br label %for.cond1, !dbg !159, !llvm.loop !160

for.end7:                                         ; preds = %for.cond1
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !162
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !163
  %arraydecay8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !163
  %8 = bitcast %struct._twoIntsStruct* %arraydecay8 to i8*, !dbg !163
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !163
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !164
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !164
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx9), !dbg !165
  ret void, !dbg !166
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 23, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !21, line: 100, baseType: !22)
!21 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !21, line: 96, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !22, file: !21, line: 98, baseType: !16, size: 32)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !22, file: !21, line: 99, baseType: !16, size: 32, offset: 32)
!26 = !DILocation(line: 24, column: 21, scope: !11)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 25, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 25, column: 19, scope: !11)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 26, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 6400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 26, column: 19, scope: !11)
!37 = !DILocation(line: 27, column: 11, scope: !38)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!39 = !DILocation(line: 27, column: 9, scope: !38)
!40 = !DILocation(line: 27, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 27, column: 5)
!42 = !DILocation(line: 27, column: 18, scope: !41)
!43 = !DILocation(line: 27, column: 5, scope: !38)
!44 = !DILocation(line: 31, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 28, column: 5)
!46 = !DILocation(line: 31, column: 14, scope: !45)
!47 = !DILocation(line: 32, column: 5, scope: !45)
!48 = !DILocation(line: 27, column: 24, scope: !41)
!49 = !DILocation(line: 27, column: 5, scope: !41)
!50 = distinct !{!50, !43, !51, !52}
!51 = !DILocation(line: 32, column: 5, scope: !38)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocalVariable(name: "source", scope: !54, file: !12, line: 34, type: !33)
!54 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!55 = !DILocation(line: 34, column: 23, scope: !54)
!56 = !DILocalVariable(name: "i", scope: !57, file: !12, line: 36, type: !58)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 35, column: 9)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !59, line: 46, baseType: !60)
!59 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 36, column: 20, scope: !57)
!62 = !DILocation(line: 38, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !12, line: 38, column: 13)
!64 = !DILocation(line: 38, column: 18, scope: !63)
!65 = !DILocation(line: 38, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 38, column: 13)
!67 = !DILocation(line: 38, column: 27, scope: !66)
!68 = !DILocation(line: 38, column: 13, scope: !63)
!69 = !DILocation(line: 40, column: 24, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 39, column: 13)
!71 = !DILocation(line: 40, column: 17, scope: !70)
!72 = !DILocation(line: 40, column: 27, scope: !70)
!73 = !DILocation(line: 40, column: 34, scope: !70)
!74 = !DILocation(line: 41, column: 24, scope: !70)
!75 = !DILocation(line: 41, column: 17, scope: !70)
!76 = !DILocation(line: 41, column: 27, scope: !70)
!77 = !DILocation(line: 41, column: 34, scope: !70)
!78 = !DILocation(line: 42, column: 13, scope: !70)
!79 = !DILocation(line: 38, column: 35, scope: !66)
!80 = !DILocation(line: 38, column: 13, scope: !66)
!81 = distinct !{!81, !68, !82, !52}
!82 = !DILocation(line: 42, column: 13, scope: !63)
!83 = !DILocation(line: 45, column: 17, scope: !54)
!84 = !DILocation(line: 45, column: 9, scope: !54)
!85 = !DILocation(line: 46, column: 26, scope: !54)
!86 = !DILocation(line: 46, column: 9, scope: !54)
!87 = !DILocation(line: 48, column: 1, scope: !11)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 85, column: 5, scope: !88)
!90 = !DILocation(line: 86, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !92, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!16, !16, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !12, line: 98, type: !16)
!98 = !DILocation(line: 98, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !12, line: 98, type: !94)
!100 = !DILocation(line: 98, column: 27, scope: !91)
!101 = !DILocation(line: 101, column: 22, scope: !91)
!102 = !DILocation(line: 101, column: 12, scope: !91)
!103 = !DILocation(line: 101, column: 5, scope: !91)
!104 = !DILocation(line: 103, column: 5, scope: !91)
!105 = !DILocation(line: 104, column: 5, scope: !91)
!106 = !DILocation(line: 105, column: 5, scope: !91)
!107 = !DILocation(line: 108, column: 5, scope: !91)
!108 = !DILocation(line: 109, column: 5, scope: !91)
!109 = !DILocation(line: 110, column: 5, scope: !91)
!110 = !DILocation(line: 112, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "h", scope: !111, file: !12, line: 57, type: !16)
!113 = !DILocation(line: 57, column: 9, scope: !111)
!114 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 58, type: !19)
!115 = !DILocation(line: 58, column: 21, scope: !111)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !12, line: 59, type: !28)
!117 = !DILocation(line: 59, column: 19, scope: !111)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !12, line: 60, type: !33)
!119 = !DILocation(line: 60, column: 19, scope: !111)
!120 = !DILocation(line: 61, column: 11, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !12, line: 61, column: 5)
!122 = !DILocation(line: 61, column: 9, scope: !121)
!123 = !DILocation(line: 61, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 61, column: 5)
!125 = !DILocation(line: 61, column: 18, scope: !124)
!126 = !DILocation(line: 61, column: 5, scope: !121)
!127 = !DILocation(line: 64, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 62, column: 5)
!129 = !DILocation(line: 64, column: 14, scope: !128)
!130 = !DILocation(line: 65, column: 5, scope: !128)
!131 = !DILocation(line: 61, column: 24, scope: !124)
!132 = !DILocation(line: 61, column: 5, scope: !124)
!133 = distinct !{!133, !126, !134, !52}
!134 = !DILocation(line: 65, column: 5, scope: !121)
!135 = !DILocalVariable(name: "source", scope: !136, file: !12, line: 67, type: !33)
!136 = distinct !DILexicalBlock(scope: !111, file: !12, line: 66, column: 5)
!137 = !DILocation(line: 67, column: 23, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !139, file: !12, line: 69, type: !58)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 68, column: 9)
!140 = !DILocation(line: 69, column: 20, scope: !139)
!141 = !DILocation(line: 71, column: 20, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 71, column: 13)
!143 = !DILocation(line: 71, column: 18, scope: !142)
!144 = !DILocation(line: 71, column: 25, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 71, column: 13)
!146 = !DILocation(line: 71, column: 27, scope: !145)
!147 = !DILocation(line: 71, column: 13, scope: !142)
!148 = !DILocation(line: 73, column: 24, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !12, line: 72, column: 13)
!150 = !DILocation(line: 73, column: 17, scope: !149)
!151 = !DILocation(line: 73, column: 27, scope: !149)
!152 = !DILocation(line: 73, column: 34, scope: !149)
!153 = !DILocation(line: 74, column: 24, scope: !149)
!154 = !DILocation(line: 74, column: 17, scope: !149)
!155 = !DILocation(line: 74, column: 27, scope: !149)
!156 = !DILocation(line: 74, column: 34, scope: !149)
!157 = !DILocation(line: 75, column: 13, scope: !149)
!158 = !DILocation(line: 71, column: 35, scope: !145)
!159 = !DILocation(line: 71, column: 13, scope: !145)
!160 = distinct !{!160, !147, !161, !52}
!161 = !DILocation(line: 75, column: 13, scope: !142)
!162 = !DILocation(line: 78, column: 17, scope: !136)
!163 = !DILocation(line: 78, column: 9, scope: !136)
!164 = !DILocation(line: 79, column: 26, scope: !136)
!165 = !DILocation(line: 79, column: 9, scope: !136)
!166 = !DILocation(line: 81, column: 1, scope: !111)
