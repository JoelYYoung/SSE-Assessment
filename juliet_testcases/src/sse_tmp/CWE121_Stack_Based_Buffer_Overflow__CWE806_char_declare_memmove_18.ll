; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  br label %source, !dbg !26

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !27), !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !30
  %1 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  %call = call i64 @strlen(i8* %4) #7, !dbg !42
  %mul = mul i64 %call, 1, !dbg !43
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %3, i64 %mul, i1 false), !dbg !39
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !44
  store i8 0, i8* %arrayidx2, align 1, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %5), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #8, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #8, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !76
  store i8* %arraydecay, i8** %data, align 8, !dbg !77
  br label %source, !dbg !78

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !79), !dbg !80
  %0 = load i8*, i8** %data, align 8, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !82
  %1 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !87
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !88
  %3 = load i8*, i8** %data, align 8, !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %call = call i64 @strlen(i8* %4) #7, !dbg !91
  %mul = mul i64 %call, 1, !dbg !92
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %3, i64 %mul, i1 false), !dbg !88
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !93
  store i8 0, i8* %arrayidx2, align 1, !dbg !94
  %5 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* %5), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 12, scope: !11)
!25 = !DILocation(line: 27, column: 10, scope: !11)
!26 = !DILocation(line: 28, column: 5, scope: !11)
!27 = !DILabel(scope: !11, name: "source", file: !12, line: 29)
!28 = !DILocation(line: 29, column: 1, scope: !11)
!29 = !DILocation(line: 31, column: 12, scope: !11)
!30 = !DILocation(line: 31, column: 5, scope: !11)
!31 = !DILocation(line: 32, column: 5, scope: !11)
!32 = !DILocation(line: 32, column: 17, scope: !11)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 34, type: !35)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 34, column: 14, scope: !34)
!39 = !DILocation(line: 36, column: 9, scope: !34)
!40 = !DILocation(line: 36, column: 23, scope: !34)
!41 = !DILocation(line: 36, column: 36, scope: !34)
!42 = !DILocation(line: 36, column: 29, scope: !34)
!43 = !DILocation(line: 36, column: 41, scope: !34)
!44 = !DILocation(line: 37, column: 9, scope: !34)
!45 = !DILocation(line: 37, column: 20, scope: !34)
!46 = !DILocation(line: 38, column: 19, scope: !34)
!47 = !DILocation(line: 38, column: 9, scope: !34)
!48 = !DILocation(line: 40, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_18_good", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 68, column: 5, scope: !49)
!51 = !DILocation(line: 69, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 81, type: !53, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 81, type: !55)
!58 = !DILocation(line: 81, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 81, type: !56)
!60 = !DILocation(line: 81, column: 27, scope: !52)
!61 = !DILocation(line: 84, column: 22, scope: !52)
!62 = !DILocation(line: 84, column: 12, scope: !52)
!63 = !DILocation(line: 84, column: 5, scope: !52)
!64 = !DILocation(line: 86, column: 5, scope: !52)
!65 = !DILocation(line: 87, column: 5, scope: !52)
!66 = !DILocation(line: 88, column: 5, scope: !52)
!67 = !DILocation(line: 91, column: 5, scope: !52)
!68 = !DILocation(line: 92, column: 5, scope: !52)
!69 = !DILocation(line: 93, column: 5, scope: !52)
!70 = !DILocation(line: 95, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 49, type: !16)
!73 = !DILocation(line: 49, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 50, type: !20)
!75 = !DILocation(line: 50, column: 10, scope: !71)
!76 = !DILocation(line: 51, column: 12, scope: !71)
!77 = !DILocation(line: 51, column: 10, scope: !71)
!78 = !DILocation(line: 52, column: 5, scope: !71)
!79 = !DILabel(scope: !71, name: "source", file: !12, line: 53)
!80 = !DILocation(line: 53, column: 1, scope: !71)
!81 = !DILocation(line: 55, column: 12, scope: !71)
!82 = !DILocation(line: 55, column: 5, scope: !71)
!83 = !DILocation(line: 56, column: 5, scope: !71)
!84 = !DILocation(line: 56, column: 16, scope: !71)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !12, line: 58, type: !35)
!86 = distinct !DILexicalBlock(scope: !71, file: !12, line: 57, column: 5)
!87 = !DILocation(line: 58, column: 14, scope: !86)
!88 = !DILocation(line: 60, column: 9, scope: !86)
!89 = !DILocation(line: 60, column: 23, scope: !86)
!90 = !DILocation(line: 60, column: 36, scope: !86)
!91 = !DILocation(line: 60, column: 29, scope: !86)
!92 = !DILocation(line: 60, column: 41, scope: !86)
!93 = !DILocation(line: 61, column: 9, scope: !86)
!94 = !DILocation(line: 61, column: 20, scope: !86)
!95 = !DILocation(line: 62, column: 19, scope: !86)
!96 = !DILocation(line: 62, column: 9, scope: !86)
!97 = !DILocation(line: 64, column: 1, scope: !71)
