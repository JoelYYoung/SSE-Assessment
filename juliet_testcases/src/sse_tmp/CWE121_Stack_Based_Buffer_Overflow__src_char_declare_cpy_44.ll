; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !35
  %3 = load i8*, i8** %data, align 8, !dbg !36
  call void %2(i8* %3), !dbg !35
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !38 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !47
  %1 = load i8*, i8** %data.addr, align 8, !dbg !48
  %call = call i8* @strcpy(i8* %arraydecay, i8* %1) #5, !dbg !49
  %2 = load i8*, i8** %data.addr, align 8, !dbg !50
  call void @printLine(i8* %2), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !78, metadata !DIExpression()), !dbg !79
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i8* %arraydecay, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !85
  %1 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !88
  %3 = load i8*, i8** %data, align 8, !dbg !89
  call void %2(i8* %3), !dbg !88
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !91 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !97
  %1 = load i8*, i8** %data.addr, align 8, !dbg !98
  %call = call i8* @strcpy(i8* %arraydecay, i8* %1) #5, !dbg !99
  %2 = load i8*, i8** %data.addr, align 8, !dbg !100
  call void @printLine(i8* %2), !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44_bad", scope: !12, file: !12, line: 33, type: !13, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 35, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 35, column: 12, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 37, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 37, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 38, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 38, column: 10, scope: !11)
!29 = !DILocation(line: 39, column: 12, scope: !11)
!30 = !DILocation(line: 39, column: 10, scope: !11)
!31 = !DILocation(line: 41, column: 12, scope: !11)
!32 = !DILocation(line: 41, column: 5, scope: !11)
!33 = !DILocation(line: 42, column: 5, scope: !11)
!34 = !DILocation(line: 42, column: 17, scope: !11)
!35 = !DILocation(line: 44, column: 5, scope: !11)
!36 = !DILocation(line: 44, column: 13, scope: !11)
!37 = !DILocation(line: 45, column: 1, scope: !11)
!38 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "data", arg: 1, scope: !38, file: !12, line: 23, type: !16)
!40 = !DILocation(line: 23, column: 28, scope: !38)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 26, type: !43)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 25, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 26, column: 14, scope: !42)
!47 = !DILocation(line: 28, column: 16, scope: !42)
!48 = !DILocation(line: 28, column: 22, scope: !42)
!49 = !DILocation(line: 28, column: 9, scope: !42)
!50 = !DILocation(line: 29, column: 19, scope: !42)
!51 = !DILocation(line: 29, column: 9, scope: !42)
!52 = !DILocation(line: 31, column: 1, scope: !38)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_44_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 76, column: 5, scope: !53)
!55 = !DILocation(line: 77, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !57, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 88, type: !59)
!62 = !DILocation(line: 88, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 88, type: !60)
!64 = !DILocation(line: 88, column: 27, scope: !56)
!65 = !DILocation(line: 91, column: 22, scope: !56)
!66 = !DILocation(line: 91, column: 12, scope: !56)
!67 = !DILocation(line: 91, column: 5, scope: !56)
!68 = !DILocation(line: 93, column: 5, scope: !56)
!69 = !DILocation(line: 94, column: 5, scope: !56)
!70 = !DILocation(line: 95, column: 5, scope: !56)
!71 = !DILocation(line: 98, column: 5, scope: !56)
!72 = !DILocation(line: 99, column: 5, scope: !56)
!73 = !DILocation(line: 100, column: 5, scope: !56)
!74 = !DILocation(line: 102, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 64, type: !16)
!77 = !DILocation(line: 64, column: 12, scope: !75)
!78 = !DILocalVariable(name: "funcPtr", scope: !75, file: !12, line: 65, type: !20)
!79 = !DILocation(line: 65, column: 12, scope: !75)
!80 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !12, line: 66, type: !25)
!81 = !DILocation(line: 66, column: 10, scope: !75)
!82 = !DILocation(line: 67, column: 12, scope: !75)
!83 = !DILocation(line: 67, column: 10, scope: !75)
!84 = !DILocation(line: 69, column: 12, scope: !75)
!85 = !DILocation(line: 69, column: 5, scope: !75)
!86 = !DILocation(line: 70, column: 5, scope: !75)
!87 = !DILocation(line: 70, column: 16, scope: !75)
!88 = !DILocation(line: 71, column: 5, scope: !75)
!89 = !DILocation(line: 71, column: 13, scope: !75)
!90 = !DILocation(line: 72, column: 1, scope: !75)
!91 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 52, type: !21, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", arg: 1, scope: !91, file: !12, line: 52, type: !16)
!93 = !DILocation(line: 52, column: 32, scope: !91)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !12, line: 55, type: !43)
!95 = distinct !DILexicalBlock(scope: !91, file: !12, line: 54, column: 5)
!96 = !DILocation(line: 55, column: 14, scope: !95)
!97 = !DILocation(line: 57, column: 16, scope: !95)
!98 = !DILocation(line: 57, column: 22, scope: !95)
!99 = !DILocation(line: 57, column: 9, scope: !95)
!100 = !DILocation(line: 58, column: 19, scope: !95)
!101 = !DILocation(line: 58, column: 9, scope: !95)
!102 = !DILocation(line: 60, column: 1, scope: !91)
